import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupRepository {
  final FirebaseAuth auth;

  SignupRepository({required this.auth});

  Future<Either<String, bool?>> signUp(
      {required String email, required String password,  required String userName}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user?.updateDisplayName(userName);
      return right(userCredential.user != null);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to SignUp');
    }
  }
}

final signUpRepoProvider = Provider<SignupRepository>(
      (ref) => SignupRepository(auth: FirebaseAuth.instance)
);