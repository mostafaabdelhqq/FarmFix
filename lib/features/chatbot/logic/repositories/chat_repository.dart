import 'package:google_generative_ai/google_generative_ai.dart';

import '../../data/models/message_model.dart';

abstract class ChatRepository {
  Future<MessageModel> sendMessage(String message, List<Content> history);

  // ❌ حذفنا sendMessageStream لأن الـ API بترفضه
  // Stream<MessageModel> sendMessageStream(String message, List<Content> history);

  List<Content> convertToGeminiHistory(List<MessageModel> messages);
}
