import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/splash/auth_repository.dart';
import 'package:lets_chat/features/splash/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this.repository) : super(const AuthState.initial());
  final AuthRepository repository;

  Future<void> isUserLoggedIn() async {
     state = const AuthState.loading();
     final response = await repository.isUserLoggedIn();
     state = response.fold(
          (error) => AuthState.unauthenticated(message: error),
          (response) => AuthState.authenticated(user: response),
    );
  }
}

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
      (ref) => AuthStateNotifier(ref.read(autRepoProvider)),
);