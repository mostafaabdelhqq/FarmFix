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
        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ChatError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        // Your normal chat UI
        return const ChatPage();
      },
    );
  }
}
