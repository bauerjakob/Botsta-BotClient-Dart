class Message {
  const Message(this.id, this.text, this.chatroomId, this.sendTime);

  final String id;
  final String text;
  final String chatroomId;
  final DateTime sendTime;
}