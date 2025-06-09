import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/chatbot/data/datasources/gemini_data_source.dart';
import 'package:farmfix/features/chatbot/data/repositories/chat_repository_impl.dart';
import 'package:farmfix/features/chatbot/logic/cubits/chat_cubit.dart';
import 'package:farmfix/features/chatbot/presentation/views/widgets/chatbot_body.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
          title: Text(S.of(context).farmFixAssistant),
          titleTextStyle: GoogleFonts.righteous(
            fontSize: 22.sp,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF009951),
                  Color(0xFF006636),
                  Color(0xFF004D29),
                  // Color(0xFF004022),
                  Color(0xFF00331B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsData.chatbotIcon),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsData.chatBg),
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: const ChatbotBody(),
        ),
      ),
    );
  }
}
