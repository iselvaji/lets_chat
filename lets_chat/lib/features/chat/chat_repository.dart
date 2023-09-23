import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lets_chat/model/chat_model.dart';

class ChatRepository {

  Future<Either<String, List<ChatModel>>> getChatDetailsByUserId(
      {required String currentUserId, required String friendId}) async {

    try {
      var chatSnapShots = FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserId)
          .collection('messages')
          .doc(friendId)
          .collection('chats')
          .orderBy("date", descending: true)
          .snapshots();

      List<ChatModel> msgList = [];

      chatSnapShots.forEach((QuerySnapshot snapShot) {
        for (var doc in snapShot.docs) {
          var msg = doc['message'];
          var msgDate = DateTime.parse(doc['date'].toDate().toString());
          var msgTime = DateFormat(' hh:mm a').format(msgDate);
          bool isCurrentUser = doc['senderId'] == currentUserId;
          msgList.add(ChatModel(message: msg, msgTime: msgTime, isCurrentUser: isCurrentUser));
        }
      });
      return right(msgList);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to get chat messages');
    }
  }

  Future <Either<String, bool>> saveChatMessage({required String currentUserId, required String friendId, required String message}) async{

    try {
        await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUserId)
          .collection('messages')
          .doc(friendId)
          .collection('chats')
          .add({
              "senderId": currentUserId,
              "receiverId": friendId,
              "message": message,
              "type": "text",
              "date": DateTime.now()
          }).then((value) async {
            await FirebaseFirestore.instance
                  .collection('user')
                  .doc(currentUserId)
                  .collection('messages')
                  .doc(friendId)
                  .set({'last_msg': message, "date": DateTime.now()});
          });

        await FirebaseFirestore.instance
              .collection('user')
              .doc(friendId)
              .collection('messages')
              .doc(currentUserId)
              .collection("chats")
              .add({
            "senderId": currentUserId,
            "receiverId": friendId,
            "message": message,
            "type": "text",
            "date": DateTime.now(),
          }).then((value) async {
          await FirebaseFirestore.instance
                .collection('user')
                .doc(friendId)
                .collection('messages')
                .doc(currentUserId)
                .set({"last_msg": message, "date": DateTime.now()});
          });
          return right(true);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to save chat messages');
    }
  }
}

final chatRepoProvider = Provider<ChatRepository>(
      (ref) => ChatRepository()
);