part of 'chat_cubit.dart';

abstract class ChatState {
  final List<MessageModel> messages;

  const ChatState(this.messages);
}

class ChatInitial extends ChatState {
  ChatInitial() : super([]);
}

class ChatLoading extends ChatState {
  ChatLoading(super.messages);
}

class ChatSuccess extends ChatState {
  ChatSuccess(super.messages);
}

class ChatError extends ChatState {
  final String error;

  ChatError(super.messages, this.error);
}
