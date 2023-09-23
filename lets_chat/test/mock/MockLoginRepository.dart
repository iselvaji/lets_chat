
import 'package:dartz/dartz.dart';
import 'package:lets_chat/features/login/login_repository.dart';
import 'package:lets_chat/model/user_model.dart';
import 'package:mockito/mockito.dart';

import 'MockFirebaseAuth.dart';

class MockLoginRepository extends Mock implements LoginRepository {
  @override
  final MockFirebaseAuth auth;
  MockLoginRepository({required this.auth});

  Future<Either<String, UserModel>> login({required String email, required String password}) async {
    var user = UserModel(email: "fake@abc.com", name: "Test", image: null, uid: "123");
    return right(user) as Right<String, UserModel>;
  }
}