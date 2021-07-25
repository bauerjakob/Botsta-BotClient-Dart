
import 'package:botsta_botclient/src/graphql/login.req.gql.dart';
import 'package:graphql/client.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:botsta_botclient/src/extensions/extensions.dart';
import 'package:ferry/ferry.dart';

import 'graphql/refresh_token.req.gql.dart';

class BotstaClient {
  late String _botName;
  late String _apiKey;
  late String _serverUrl;
  late String _serverUrlWebsocket;

  late String? _refreshToken;
  String? _token;

  BotstaClient(String botName, String apiKey, String serverUrl, String serverUrlWebsocket) {
    _botName = botName;
    _apiKey = apiKey;
    _serverUrl = serverUrl;
    _serverUrlWebsocket;
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
    final client = await _getHttpClientWithTokenAsync(null);

    var loginRes = await client.requestFirst(GLoginReq((b) => b
      ..vars.name = _botName
      ..vars.secret = _apiKey
      ..vars.publicKey = 'todo'));

    await client.dispose();

    if (loginRes.hasErrors 
      && loginRes.data?.login == null 
      && loginRes.data!.login!.hasError) {
        throw Exception('Error while login');
      }

      var res = loginRes.data!.login!;
      _refreshToken = res.refreshToken;
      _token = res.token;
  }
  

  Future _refreshTokenAsync() async {
    final client = await _getHttpClientWithTokenAsync(null);
    var res = await client.requestFirst(GRefreshTokenReq());

    if (res.hasErrors || res.data?.refreshToken == null || res.data!.refreshToken!.hasError) {
      throw Exception('Error while refresh token');
    }

    _token = res.data!.refreshToken!.token!;
  }

}