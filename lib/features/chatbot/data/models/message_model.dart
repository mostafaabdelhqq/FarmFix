class MessageModel {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isStreaming;

  MessageModel({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isStreaming = false,
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

  MessageModel copyWith({
    String? text,
    bool? isUser,
    DateTime? timestamp,
    bool? isStreaming,
  }) {
    return MessageModel(
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
      isStreaming: isStreaming ?? this.isStreaming,
    );
  }
}
