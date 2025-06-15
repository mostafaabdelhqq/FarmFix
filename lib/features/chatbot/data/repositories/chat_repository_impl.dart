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

  // ❌ حذفنا sendMessageStream لأنه مش مدعوم حاليًا من Google Generative AI
  // @override
  // Stream<MessageModel> sendMessageStream(
  //     String message, List<Content> history) async* {
  //   final response = await sendMessage(message, history);
  //   yield response;
  // }

  // ✅ بناء تاريخ المحادثة بشكل صحيح
  @override
  List<Content> convertToGeminiHistory(List<MessageModel> messages) {
    return messages
        .where((message) => message.text.trim().isNotEmpty)
        .map(
          (message) => message.isUser
              ? Content.text(message.text)
              : Content.model([TextPart(message.text)]),
        )
        .toList();
  }
}
