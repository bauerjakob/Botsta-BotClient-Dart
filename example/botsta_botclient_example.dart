import 'package:botsta_botclient/botsta_botclient.dart';

void main() async {
  print('started');
  final client = BotstaClient('Heyho', 'iJRrz/jm8x', 'http://localhost:5000/graphql', 'ws://localhost:5000/graphql');
  final messageSubscription = await client.messageSubscriptionAsync();

  messageSubscription.listen((msg) {
    print(msg.text);
    client.sendMessageAsync(msg.chatroomId, msg.text);
  });

}
