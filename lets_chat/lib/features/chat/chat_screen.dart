import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/chat/chat_provider.dart';

import '../../model/user_model.dart';
import 'package:lets_chat/constants/app_constants.dart';

import 'chat_message.dart';
import 'message_field.dart';

class ChatScreen extends ConsumerStatefulWidget {

  final UserModel currentUser;
  final String friendId;
  final String friendName;

  const ChatScreen(this.currentUser, this.friendId, this.friendName, {Key? key}) : super(key: key);

  @override
  ChatScreenWidgetState createState() => ChatScreenWidgetState();
}

class ChatScreenWidgetState extends ConsumerState<ChatScreen> {

  @override
  void initState() {
    super.initState();
    // fetch data only after first frame
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) {
        ref.read(chatProvider.notifier).getChatDetailsByUserId(currentUserId: widget.currentUser.uid, friendId: widget.friendId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(chatProvider).when(
        chats : (messages) {
          return Scaffold(
              appBar: AppBar(backgroundColor: Colors.blue,
                title: Row(
                  children: [
                    Text(widget.friendName, style: const TextStyle(fontSize: Sizes.dimen_20))
                  ],
                ),
              ),
              body: Column(
                  children: [
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(Sizes.dimen_10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Sizes.dimen_24),
                                    topRight: Radius.circular(Sizes.dimen_24)
                                )
                            ),
                            child: ListView.builder(
                                itemCount: messages.length,
                                reverse: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ChatMessage(
                                      message: messages[index].message,
                                      isMe: messages[index].isCurrentUser,
                                      time: messages[index].msgTime);
                                }
                            )
                        )
                    ),
                    MessageField(widget.currentUser.uid, widget.friendId),
                  ]
              )
          );
        },
        initial: () {
          return const Center(child: CircularProgressIndicator());
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        });
  }
}