import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String email;
  String name;
  String? image;
  String uid;

  UserModel(
      {required this.email,
        required this.name,
        required this.image,
        required this.uid});

  factory UserModel.fromJson(UserCredential credential) {
    return UserModel(
      email: credential.user?.email ?? "",
      name: credential.user?.displayName ?? "",
      image: credential.user?.photoURL ?? "",
      uid: credential.user?.uid ?? "",
    );
  }

  factory UserModel.fromUserJson(User user) {
    return UserModel(
      email: user.email ?? "",
      name: user.displayName ?? "",
      image: user.photoURL ?? "",
      uid: user.uid ?? "",
    );
  }
}