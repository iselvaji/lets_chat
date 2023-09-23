import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/chat_room_model.dart';

class ChatRoomRepository {

  Future<Either<String, List<ChatRoomModel>>> getChatRooms({required String currentUserId}) async {
    try {
      var chatroomsSnapShots = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUserId)
          .collection('messages')
          .get();

      List<ChatRoomModel> chatRoomsList = [];

      if(chatroomsSnapShots.docs.isNotEmpty) {
        for (var doc in chatroomsSnapShots.docs) {
            var friendId = doc.id;
            var lastMsg = doc['last_msg'];

            var msgDate = DateTime.parse(doc['date'].toDate().toString());
            var msgTime = DateFormat(' hh:mm a').format(msgDate);
            var friendName = await _getFriendName(friendId: friendId);

            chatRoomsList.add(ChatRoomModel(message: lastMsg, msgTime: msgTime, friendId: friendId, friendName: friendName));
        }
      }
      return right(chatRoomsList);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to get chat messages');
    }
  }

  Future<String> _getFriendName({required String friendId}) async {
      var friendSnapshot = await FirebaseFirestore.instance.collection('user').doc(friendId).get();
      Map<String, dynamic> data = friendSnapshot.data()!;
      var friendName = data['name'];
      return friendName;
  }
}

final chatRoomsRepoProvider = Provider<ChatRoomRepository>(
      (ref) => ChatRoomRepository()
);