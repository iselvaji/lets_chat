import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/constants/app_constants.dart';
import 'package:lets_chat/features/chat/chat_provider.dart';

class MessageField extends ConsumerStatefulWidget {
  final String currentId;
  final String friendId;

  const MessageField(this.currentId, this.friendId, {super.key});

  @override
  MessageFieldState createState() => MessageFieldState();
}

class MessageFieldState extends ConsumerState<MessageField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsetsDirectional.all(Sizes.dimen_8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: StringConstants.type_message,
                    fillColor: Colors.grey[50],
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0),
                        gapPadding: Sizes.dimen_10,
                        borderRadius: BorderRadius.circular(Sizes.dimen_24))),
              )),
          const SizedBox(width: Sizes.dimen_20),
          GestureDetector(
            //onTap: () async {
             onTap: () {
                 String message = _controller.text;
                 _controller.clear();
                  if(message.isNotEmpty) {
                    ref.read(chatProvider.notifier).saveChatMessage(currentUserId: widget.currentId, friendId: widget.friendId, message: message);
                  }
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.dimen_8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}