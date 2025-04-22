import 'package:farmfix/features/chatbot/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          minWidth: MediaQuery.of(context).size.width * .2,
        ),
        child: Card(
          color: message.isUser
              ? const Color(0xff5DB996)
              : const Color(0xff047C43),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  Row(
                  children: [
                    Icon(message.isUser ? Icons.person : Icons.android),
                    const SizedBox(width: 8),
                    Text(
                      message.isUser ? 'You' : 'Gemini',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ), */
                const SizedBox(height: 8),
                MarkdownBody(data: message.text),
                const SizedBox(height: 4),
                Text(
                  '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
