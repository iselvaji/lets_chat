import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/user_model.dart';

class LoginRepository {

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  LoginRepository({
    required this.auth,
    required this.firestore,
  });

  Future<Either<String, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final response = await auth.signInWithEmailAndPassword(email: email, password: password);
      var user = UserModel.fromJson(response);
      _checkAndSaveUserDetails(user);
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Login');
    }
  }

  _checkAndSaveUserDetails(UserModel loggedUser) async {
    DocumentSnapshot userExist = await firestore.collection('user').doc(loggedUser.uid).get();

    if (!userExist.exists) {
      await firestore.collection('user').doc(loggedUser.uid).set({
        'email': loggedUser.email,
        'name': loggedUser.name,
        'image': loggedUser.image,
        'uid': loggedUser.uid,
        'date': DateTime.now(),
      });
    }
  }
}

final loginRepoProvider = Provider<LoginRepository>(
      (ref) => LoginRepository(
        auth: FirebaseAuth.instance,
        firestore: FirebaseFirestore.instance),
);