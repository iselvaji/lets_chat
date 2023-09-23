class ChatModel {
  String message;
  String msgTime;
  bool isCurrentUser;

  ChatModel({
    required this.message,
    required this.msgTime,
    required this.isCurrentUser
  });
}