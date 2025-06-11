import 'package:google_generative_ai/google_generative_ai.dart';

import '../../logic/repositories/chat_repository.dart';
import '../datasources/gemini_data_source.dart';
import '../models/message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final GeminiDataSource _dataSource;

  ChatRepositoryImpl(this._dataSource);

  @override
  Future<MessageModel> sendMessage(
      String message, List<Content> history) async {
    final response = await _dataSource.getResponse(message, history);
    return MessageModel.bot(response);
  }

  @override
  Stream<MessageModel> sendMessageStream(
      String message, List<Content> history) {
    return _dataSource
        .getResponseStream(message, history)
        .map((text) => MessageModel.bot(
              '',
            ));
  }

  @override
  List<Content> convertToGeminiHistory(List<MessageModel> messages) {
    return messages
        .where((message) => !message.isUser)
        .map((message) => Content.text(message.text))
        .toList();
  }
}
