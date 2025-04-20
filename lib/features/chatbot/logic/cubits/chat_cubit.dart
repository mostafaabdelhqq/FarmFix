import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message_model.dart';
import '../repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _repository;
  final List<MessageModel> _messages = [];

  ChatCubit(this._repository) : super(ChatInitial()) {
    _addWelcomeMessage();
  }

  List<MessageModel> get messages => _messages;

  void _addWelcomeMessage() {
    if (_messages.isEmpty) {
      final welcomeMessage = MessageModel.bot(
        " Welcome to FarmFix Assistant! \n\n"
        "I'm here to help with all your agriculture and climate questions. ",
        isTyping: false,
      );
      _messages.add(welcomeMessage);
      emit(ChatSuccess([..._messages]));
    }
  }

  Future<void> sendMessage(String message) async {
    // Add user message immediately
    _messages.add(MessageModel.user(message));
    emit(ChatSuccess([..._messages]));

    // Create a temporary bot message that will be updated
    final botMessage = MessageModel.bot('', isTyping: true);
    _messages.add(botMessage);
    emit(ChatLoading([..._messages]));

    try {
      final history = _repository.convertToGeminiHistory(_messages);
      final responseStream = _repository.sendMessageStream(message, history);

      String fullResponse = '';
      await for (final response in responseStream) {
        fullResponse += response.text;
        // Update the last message with new content
        _messages.last = _messages.last.copyWith(
          text: fullResponse,
          isTyping: true,
        );
        emit(ChatSuccess([..._messages]));
      }

      // Mark typing as complete when done
      _messages.last = _messages.last.copyWith(isTyping: false);
      emit(ChatSuccess([..._messages]));
    } catch (e) {
      _messages.last = _messages.last.copyWith(
        text: 'Error: ${e.toString()}',
        isTyping: false,
      );
      emit(ChatError([..._messages], e.toString()));
    }
  }
}
