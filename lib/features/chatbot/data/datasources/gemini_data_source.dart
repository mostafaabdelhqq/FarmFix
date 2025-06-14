import 'package:google_generative_ai/google_generative_ai.dart';

// gemini_data_source.dart
class GeminiDataSource {
  static const _apiKey = 'AIzaSyAAo6HRSChWLyKXY8WFptBItmafKXA0yhY';
  static const _modelName =
      'gemini-1.5-flash'; // Updated to a more capable model

  final GenerativeModel _model;

  GeminiDataSource()
      : _model = GenerativeModel(
          model: _modelName,
          apiKey: _apiKey,
          generationConfig: GenerationConfig(
            maxOutputTokens: 2000,
            temperature: 0.9,
            topP: 0.9,
          ),
          systemInstruction: Content.text(
            '''
You are FarmFix Assistant, an expert ONLY in agriculture and climate-related topics.

Language Rules:
- If the user's message is in Arabic (العربية), respond entirely in Arabic.
- If the user's message is in English, respond entirely in English.
- Always match the language of the user's question.

Your expertise includes:
- Crop cultivation and protection
- Soil management
- Weather impacts on farming
- Sustainable agriculture practices
- Climate adaptation strategies

If asked about anything outside agriculture/climate, respond: 
"I specialize in farming and climate topics. Could you ask about crops, weather impacts, or related subjects?"
''',
          ),
        );

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
