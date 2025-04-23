class MessageModel {
  final String text;
  final DateTime timestamp;
  final bool isUser;
  final bool? isTyping;

  MessageModel(
    this.text, {
    this.isUser = false,
    DateTime? timestamp,
    this.isTyping = false,
  }) : timestamp = timestamp ?? DateTime.now();

  MessageModel.user(String text) : this(text, isUser: true, isTyping: false);

  MessageModel.bot(String text, {bool isTyping = false})
      : this(text, isUser: false, isTyping: isTyping);

  MessageModel copyWith({
    String? text,
    DateTime? timestamp,
    bool? isUser,
    bool? isTyping,
  }) {
    return MessageModel(
      text ?? this.text,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
