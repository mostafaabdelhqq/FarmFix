// chatbot_body.dart
import 'package:farmfix/features/chatbot/presentation/views/widgets/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubits/chat_cubit.dart';

class ChatbotBody extends StatelessWidget {
  const ChatbotBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatError) {
          return Column(
            children: [
              const Expanded(child: ChatPage()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        }
        return const ChatPage();
      },
    );
  }
}
