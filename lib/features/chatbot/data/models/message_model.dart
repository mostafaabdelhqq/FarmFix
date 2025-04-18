class MessageModel {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  factory MessageModel.user(String text) {
    return MessageModel(
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );
  }

  factory MessageModel.bot(String text) {
    return MessageModel(
      text: text,
      isUser: false,
      timestamp: DateTime.now(),
    );
  }
}
