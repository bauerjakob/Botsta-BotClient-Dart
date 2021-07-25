import 'package:botsta_botclient/botsta_botclient.dart';

void main() async {
  print('started');
  final client = BotstaClient('Heyho', 'iJRrz/jm8x', 'http://localhost:5000/graphql', 'ws://localhost:5000/graphql');
  final messageSubscription = await client.messageSubscriptionAsync();

  messageSubscription.listen((msg) async {
    print(msg.text);
    await BotstaMessageBuilder()
      .addTitle('Title')
      .addSubtitle('Subtitle')
      .addText('Text')
      .addPostbackButton('Impress me', 'Are you impressed')
      .addUrlButton('Website', 'https://bauer-jakob.de')
      .sendAsync(client, msg.chatroomId);
  });

}
