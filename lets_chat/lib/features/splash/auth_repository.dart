import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/user_model.dart';

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  Future<Either<String, UserModel?>> isUserLoggedIn() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if(user != null) {
        return right(UserModel.fromUserJson(user));
      } else {
        return right(null);
      }
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to get user credentials');
    }
  }
}

final autRepoProvider = Provider<AuthRepository>(
      (ref) => AuthRepository(auth: FirebaseAuth.instance)
);