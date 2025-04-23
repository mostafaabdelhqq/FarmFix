import 'package:farmfix/features/chatbot/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (message.isTyping == true && !message.isUser)
          const TypingIndicator(),
        Align(
          alignment:
              message.isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
              color: message.isUser
                  ? const Color(0xff009951).withOpacity(.7)
                  : const Color(0xfff3f3f3),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarkdownBody(
                      data: message.text,
                      styleSheet: MarkdownStyleSheet(
                        // Set text color based on who sent the message
                        p: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black,
                          height: 1.5,
                        ),
                        // You can add other text styles as needed
                        a: TextStyle(
                          color: message.isUser ? Colors.white : Colors.blue,
                        ),
                        h1: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black,
                        ),
                        h2: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black,
                        ),
                        h3: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color:
                                message.isUser ? Colors.white : Colors.black87,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8),
                Dot(),
                SizedBox(width: 4),
                Dot(),
                SizedBox(width: 4),
                Dot(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
