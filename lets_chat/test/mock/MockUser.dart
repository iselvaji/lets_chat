import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {
  @override
  String get displayname => 'test name';
  @override
  String get email => 'test@t.com';
  @override
  String get uid => '123';
  @override
  String? get image => null;
}