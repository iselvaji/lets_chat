import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

import 'MockUser.dart';
import 'MockUserCredential.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth{

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var mockCredential = MockUserCredential();
    return mockCredential;
  }
}