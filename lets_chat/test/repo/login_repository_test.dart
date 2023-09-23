import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lets_chat/features/login/login_repository.dart';
import 'package:lets_chat/model/user_model.dart';
import 'package:mockito/mockito.dart';

import '../mock/MockFileStore.dart';
import '../mock/MockFirebaseAuth.dart';

void main() {
  late LoginRepository loginRepository;
  late FirebaseFirestore fileStore;
  late MockDocumentSnapshot mockDocumentSnapshot;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;

  setUp(() {
    fileStore = MockFileStore();
    loginRepository = LoginRepository(auth:  MockFirebaseAuth(), firestore: MockFileStore());
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });

  var userModel = UserModel(email: "test@t.com", name: "test name", image: null, uid: "123");

  group('Sign in tests', () {
    test('login should return Success when user signed in successfully', () async {
     // when(fileStore.collection('user').doc("123").get()).thenAnswer(mockDocumentSnapshot);
      when(mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);

     // when(mockDocumentSnapshot.data()).thenReturn(responseMap);

      final result = await loginRepository.login(email: "test@t.com", password: "password");
      var response = result.getOrElse(() => userModel);

      expect(true, result.isRight());
      expect("test@t.com", response.email);
      },
    );
  });
}