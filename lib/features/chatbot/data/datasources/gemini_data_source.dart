import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiDataSource {
  static const _apiKey =
      'AIzaSyAtNeoB2nPRLwh49e-kkWLD2VzxYDHdsDM'; // Move to env in production
  static const _modelName = 'gemini-2.0-flash';

  final GenerativeModel _model;

  GeminiDataSource()
      : _model = GenerativeModel(model: _modelName, apiKey: _apiKey);

  Future<String> getResponse(String prompt, List<Content> history) async {
    try {
      final chat = _model.startChat(history: history);
      final response = await chat.sendMessage(Content.text(prompt));
      return response.text ?? 'No response';
    } catch (e) {
      throw Exception('Failed to get response: $e');
    }
  }

  Stream<String> getResponseStream(
      String prompt, List<Content> history) async* {
    final chat = _model.startChat(history: history);
    final response = chat.sendMessageStream(Content.text(prompt));

    await for (final chunk in response) {
      yield chunk.text ?? '';
    }
  }
}
