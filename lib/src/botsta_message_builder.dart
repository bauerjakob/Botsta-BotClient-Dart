import 'dart:convert';

import 'package:botsta_botclient/botsta_botclient.dart';
import 'package:botsta_botclient/src/models/message_part.dart';

class BotstaMessageBuilder {
  List<MessagePart> parts = [];

  String? getMessage() {
    if (parts.isEmpty) {
      return null;
    }

    return jsonEncode(parts);
  }

  BotstaMessageBuilder addTitle(String title) {
    if (title.trim().isNotEmpty) {
      parts.add(MessagePart(title: title.trim()));
    }

    return this;
  }

  BotstaMessageBuilder addSubtitle(String subtitle) {
    if (subtitle.trim().isNotEmpty) {
      parts.add(MessagePart(subtitle: subtitle.trim()));
    }

    return this;
  }

  BotstaMessageBuilder addText(String text) {
    if (text.trim().isNotEmpty) {
      parts.add(MessagePart(text: text.trim()));
    }

    return this;
  }

  BotstaMessageBuilder addButton(MessageButton button) {
    parts.add(MessagePart(button: button));

    return this;
  }

  BotstaMessageBuilder addPostbackButton(String label, String postback) {
    if (label.trim().isNotEmpty) {
      parts.add(MessagePart(button: MessageButton(label, postback: postback.trim())));
    }

    return this;
  }

  BotstaMessageBuilder addUrlButton(String label, String url) {
    if (label.trim().isNotEmpty) {
      parts.add(MessagePart(button: MessageButton(label, url: url.trim())));
    }

    return this;
  }

  Future sendAsync(BotstaClient client, String chatroomId) async {
    await client.sendMessageBuilderAsync(chatroomId, this);
  }
}