import 'package:flutter/material.dart';
import 'package:lets_chat/constants/app_constants.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  const ChatMessage({
        super.key,
        required this.message,
        required this.isMe,
        required this.time
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(Sizes.dimen_16),
          margin: const EdgeInsets.all(Sizes.dimen_16),
          constraints: const BoxConstraints(maxWidth: Sizes.dimen_200),
          decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.teal,
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_12))),
          child: Column(
            children: <Widget>[
              Text(message, style: const TextStyle(color: Colors.white)),
              Container(
                margin: const EdgeInsets.only(left: 0.0),
                child: Text(
                  time,
                  style: const TextStyle(
                    fontSize: Sizes.dimen_10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}