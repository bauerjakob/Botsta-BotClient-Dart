class MessagePart {
  MessagePart({this.title, this.subtitle, this.text, this.button});

  String? title;
  String? subtitle;
  String? text;
  MessageButton? button;

  Map<String, dynamic> toJson() => 
    {'title': title, 'subtitle': subtitle, 'text': text, 'button': button?.toJson() };
}

class MessageButton {
  MessageButton(this.label, {this.postback, this.url});

  final String label;
  String? postback;
  String? url;

  Map<String, dynamic> toJson() => {'label': label, 'postback': postback, 'url': url };
}