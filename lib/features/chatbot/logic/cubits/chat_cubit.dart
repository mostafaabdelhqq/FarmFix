import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message_model.dart';
import '../repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _repository;
  final List<MessageModel> _messages = [];
  final String welcomeText;

  ChatCubit(
    this._repository, {
    required this.welcomeText,
  }) : super(ChatInitial()) {
    _addWelcomeMessage();
  }

  List<MessageModel> get messages => _messages;

  void _addWelcomeMessage() {
    if (_messages.isEmpty) {
      final welcomeMessage = MessageModel.bot(
        welcomeText,
        isTyping: false,
      );
      _messages.add(welcomeMessage);
      emit(ChatSuccess([..._messages]));
    }
  }

  Future<void> sendMessage(String message) async {
    _messages.add(MessageModel.user(message));
    emit(ChatSuccess([..._messages]));

    final botMessage = MessageModel.bot('', isTyping: true);
    _messages.add(botMessage);
    emit(ChatLoading([..._messages]));

    try {
      final history = _repository.convertToGeminiHistory(_messages);
      final response = await _repository.sendMessage(message, history);

      _messages[_messages.length - 1] = response.copyWith(isTyping: false);
      emit(ChatSuccess([..._messages]));
    } catch (e) {
      _messages[_messages.length - 1] = MessageModel.bot(
        'Error: ${e.toString()}',
        isTyping: false,
      );
      emit(ChatError([..._messages], e.toString()));
    }
  }
}
