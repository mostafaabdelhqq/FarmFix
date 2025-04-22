import 'package:farmfix/constants.dart';
import 'package:farmfix/features/chatbot/data/datasources/gemini_data_source.dart';
import 'package:farmfix/features/chatbot/data/repositories/chat_repository_impl.dart';
import 'package:farmfix/features/chatbot/logic/cubits/chat_cubit.dart';
import 'package:farmfix/features/chatbot/presentation/views/widgets/chatbot_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return BlocProvider(
      create: (context) => ChatCubit(
        ChatRepositoryImpl(GeminiDataSource()),
      ),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          title: const Text('FarmFix Chatbot'),
          backgroundColor: kPrimaryColor,
        ),
        body: const ChatbotBody(),
      ),
    );
  }
}
