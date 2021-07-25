import 'package:botsta_botclient/botsta_botclient.dart';

void main() async {
  final client = BotstaClient('Heyho', 'iJRrz/jm8x', 'http://localhost:5000/graphql', 'ws://localhost:5000/graphql');
  final messageSubscription = await client.messageSubscription();

  messageSubscription.listen((msg) {
    print(msg.text);
  });

}
