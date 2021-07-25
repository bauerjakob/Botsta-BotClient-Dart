
import 'dart:async';

import 'package:botsta_botclient/src/graphql/login.req.gql.dart';
import 'package:botsta_botclient/src/graphql/message_subscription.req.gql.dart';
import 'package:botsta_botclient/src/graphql/post_message.req.gql.dart';
import 'package:botsta_botclient/src/models/message.dart';
import 'package:botsta_botclient/src/services/e2ee_service.dart';
import 'package:graphql/client.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:botsta_botclient/src/extensions/extensions.dart';
import 'package:ferry/ferry.dart';

import 'graphql/chatroom_key_exchange.req.gql.dart';
import 'graphql/refresh_token.req.gql.dart';

class BotstaClient {
  late String _botName;
  late String _apiKey;
  late String _serverUrl;
  late String _serverUrlWebsocket;

  late E2EEService _e2eeService;
  String? _refreshToken;
  String? _token;
  String? _sessionId;

  BotstaClient(String botName, String apiKey, String serverUrl, String serverUrlWebsocket) {
    _botName = botName;
    _apiKey = apiKey;
    _serverUrl = serverUrl;
    _serverUrlWebsocket = serverUrlWebsocket;
  }

  Future sendMessageAsync(String chatroomId, String message) async {
    final keyExchange = await _chatroomKeyExchangeAsync(chatroomId);

    final client = await _getHttpClientAsync();
    
    final sendRequests = <Future<dynamic>>[];
    
    keyExchange.forEach((sessionId, publicKey) async {
      var encryptedMessage = await _e2eeService.encryptMessageAsync(message, publicKey);
      var request = client.requestFirst(GPostMessageReq((b) => b
        ..vars.chatroomId = chatroomId
        ..vars.message = encryptedMessage
        ..vars.receiverSessionId = sessionId));
      sendRequests.add(request);
    });

    await Future.wait(sendRequests);

    await client.dispose();
  }

  Future<Stream<Message>> messageSubscriptionAsync() async {
    final client = await _getHttpClientAsync();

    return client.request(GMessageSubscriptionReq((b) => b..vars.refreshToken = _refreshToken!))
      .asyncMap<Message?>((event) async {
        if (event.data?.messageReceived != null) {
           var msgData = event.data!.messageReceived!;

           final decrypedMessage = await _e2eeService.decrypMessageAsync(msgData.message, msgData.senderPublicKey);
           
           return Message(
             msgData.id,
             decrypedMessage,
             msgData.chatroomId,
             DateTime.parse(msgData.sendTime.value),
           );
        }

        return null;
      })
      .where((event) => event != null)
      .map((event) => event!);
  }

  Future<Map<String, String>> _chatroomKeyExchangeAsync(String chatroomId) async {
    final client = await _getHttpClientAsync();

    var res = await client.requestFirst(GChatroomKeyExchangeReq((b) => b
      ..vars.chatroomId = chatroomId));

    await client.dispose();

    if (res.hasErrors || res.data?.getChatPracticantsOfChatroom == null) {
      throw Exception();
    }

    var result = <String, String>{};

    res.data!.getChatPracticantsOfChatroom!.forEach((chatPracticant) { 
      if (chatPracticant.keyExchange != null) {
        chatPracticant.keyExchange!.forEach((key) {
          if (key.sessionId != _sessionId!) {
            result.putIfAbsent(key.sessionId, () => key.publicKey);
          }
        });
      }
    });

    return result;
  }


  Future<Client> _getHttpClientAsync() async {
    final token = await _getTokenAsync();
    
    return _getHttpClientWithTokenAsync(token);
  }

  Future<Client> _getHttpClientWithTokenAsync(String? token) async {
    final authLink = token != null ? AuthLink(
        getToken: () async => 'Bearer $token'
      )
      : null;

    final httpLink = HttpLink(_serverUrl);

    var link = authLink != null ? authLink.concat(httpLink) : httpLink;

    final socketConfig = SocketClientConfig(delayBetweenReconnectionAttempts: Duration(seconds: 1), inactivityTimeout: Duration(days: 999999));
    final webSocketLink = WebSocketLink(_serverUrlWebsocket, config: socketConfig);

    link = Link.split((request) => request.isSubscription, webSocketLink, link);

    return Client(link: link);
  }

  Future<String?> _getTokenAsync() async {
    if (_refreshToken == null) {
      await _loginAsync();
    } else if (_token == null || JwtDecoder.isExpired(_token!)) {
      await _refreshTokenAsync();
    }

    return _token;
  }

  Future _loginAsync() async {
    _e2eeService = E2EEService();
    await _e2eeService.initAsync();

    final client = await _getHttpClientWithTokenAsync(null);

    var loginRes = await client.requestFirst(GLoginReq((b) => b
      ..vars.name = _botName
      ..vars.secret = _apiKey
      ..vars.publicKey = _e2eeService.publicKey!));

    await client.dispose();

    if (loginRes.hasErrors 
      && loginRes.data?.login == null 
      && loginRes.data!.login!.hasError) {
        throw Exception('Error while login');
      }

      var res = loginRes.data!.login!;
      _refreshToken = res.refreshToken;
      _token = res.token;
      _sessionId = JwtDecoder.decode(_refreshToken!)['jti'];
  }
  

  Future _refreshTokenAsync() async {
    final client = await _getHttpClientWithTokenAsync(_refreshToken);
    var res = await client.requestFirst(GRefreshTokenReq());

    if (res.hasErrors || res.data?.refreshToken == null || res.data!.refreshToken!.hasError) {
      throw Exception('Error while refresh token');
    }

    _token = res.data!.refreshToken!.token!;
  }

}