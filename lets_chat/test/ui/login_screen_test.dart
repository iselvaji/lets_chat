
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/constants/app_constants.dart';
import 'package:lets_chat/features/login/login_provider.dart';
import 'package:lets_chat/features/login/login_screen.dart';
import 'package:lets_chat/features/login/login_state.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import '../mock/MockFirebaseAuth.dart';
import '../mock/MockFirebaseUser.dart';
import '../mock/MockLoginRepository.dart';


void main() {

  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();
  MockLoginRepository _repo;
  _repo = MockLoginRepository(auth: _auth);

  Widget isEvenTestWidget(StateNotifierProvider<LoginStateNotifier, LoginState> mockProvider) {
    return ProviderScope(

      overrides: [
        loginProvider.overrideWithProvider(mockProvider),
      ],
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }

  group("login screen test", () {

    testWidgets("validates login with empty email and password", (WidgetTester tester) async{

      final mockProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) => LoginStateNotifier(_repo));
      await tester.pumpWidget(isEvenTestWidget(mockProvider));

      await tester.tap(find.text(StringConstants.login));
      await tester.pump();

      expect(find.text(StringConstants.validation_msg_email),findsOneWidget);
      expect(find.text(StringConstants.validation_msg_password),findsOneWidget);

    });

    testWidgets("validates login with invalid email and password", (WidgetTester tester) async{

      final mockProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) => LoginStateNotifier(_repo));
      await tester.pumpWidget(isEvenTestWidget(mockProvider));

      Finder emailField = find.byKey(const Key(StringConstants.email));
      await tester.enterText(emailField, 'Test');

      Finder passwordField = find.byKey(const Key(StringConstants.password));
      await tester.enterText(passwordField, 'd');

      await tester.tap(find.text(StringConstants.login));
      await tester.pump();

      expect(find.text(StringConstants.validation_msg_email),findsOneWidget);
      expect(find.text(StringConstants.validation_msg_password),findsOneWidget);

    });

    testWidgets("validates login with valid email and password", (WidgetTester tester) async{

      final mockProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) => LoginStateNotifier(_repo));
      await tester.pumpWidget(isEvenTestWidget(mockProvider));

      when(_repo.login(email: "test@gmail.com", password: "Password")).thenAnswer((_) async { return left("Invalid user");});

      Finder emailField = find.byKey(const Key(StringConstants.email));
      await tester.enterText(emailField, 'test@gmail.com');

      Finder passwordField = find.byKey(const Key(StringConstants.password));
      await tester.enterText(passwordField, 'Password');

      await tester.tap(find.text(StringConstants.login));
      await tester.pump();

      Finder progress = find.byKey(const Key(StringConstants.loading));
      expect(progress,findsOneWidget);

    });

  });
}