import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/app_constants.dart';
import '../../model/user_model.dart';
import '../chat/chat_screen.dart';
import 'chatrooms_provider.dart';

class ChatRoomsScreen extends ConsumerStatefulWidget {

  final UserModel user;
  const ChatRoomsScreen(this.user, {Key? key}) : super(key: key);

  @override
  ChatRoomsWidgetState createState() => ChatRoomsWidgetState();

}

class ChatRoomsWidgetState extends ConsumerState<ChatRoomsScreen> {

  @override
  void initState() {
    super.initState();
    // fetch data only after first frame
    WidgetsBinding.instance.endOfFrame.then((_) {
        if (mounted) {
          ref.read(chatRoomProvider.notifier).getChatRoomDetailsByUserId(currentUserId: widget.user.uid);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(chatRoomProvider).when(
            chatRooms : (chatRooms) {
              return Scaffold(
                  appBar: AppBar(title: const Text(StringConstants.appTitle)),
                  body: chatRooms.isEmpty ?  const Center(child: Text(StringConstants.chats_empty)) :
                  ListView.builder(
                    itemCount: chatRooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.dimen_60),
                          child: Container(
                            margin: const EdgeInsets.only(),
                            width: Sizes.dimen_58,
                            height: Sizes.dimen_64,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: ProfilePicture(
                              name: chatRooms[index].friendName,
                              radius: Sizes.dimen_26,
                              fontsize: Sizes.dimen_20,
                              random: true,
                            ),
                          ),
                        ),
                        title: Text(
                          chatRooms[index].friendName,
                          style: const TextStyle(
                            fontSize: Sizes.dimen_18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                chatRooms[index].message,
                                style: const TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: Sizes.dimen_10,
                                ),
                                child: Text(
                                  chatRooms[index].msgTime,
                                  style: const TextStyle(color: Colors.black, fontSize: Sizes.dimen_10),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      widget.user,
                                      chatRooms[index].friendId,
                                      chatRooms[index].friendName
                                    // friendImage: friend['image']
                                  )));
                        },
                      );
                    },
                  )
              );
            }, initial: () {
                return const Center(child: CircularProgressIndicator());
            }, loading: () {
                return const Center(child: CircularProgressIndicator());
            }
          );
  }
}