import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message_model.dart';
import '../repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _repository;
  final List<MessageModel> _messages = [];

  ChatCubit(
    this._repository,
  ) : super(ChatInitial());

  List<MessageModel> get messages => _messages;

  Future<void> sendMessage(String message) async {
    _messages.add(MessageModel.user(message));
    emit(ChatLoading(_messages));

    try {
      final history = _repository.convertToGeminiHistory(_messages);
      final response = await _repository.sendMessage(message, history);

      _messages.add(response);
      emit(ChatSuccess(_messages));
    } catch (e) {
      emit(ChatError(_messages, e.toString()));
    }
  }

  Stream<void> sendMessageStream(String message) async* {
    _messages.add(MessageModel.user(message));
    emit(ChatLoading(_messages));

    try {
      final history = _repository.convertToGeminiHistory(_messages);
      yield* _repository.sendMessageStream(message, history).map((response) {
        _messages.add(response);
        emit(ChatSuccess(_messages));
      });
    } catch (e) {
      emit(ChatError(_messages, e.toString()));
    }
  }
}
