import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/login/login_repository.dart';
import 'package:lets_chat/features/login/login_state.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier(this.repository) : super(const LoginState.initial());
  final LoginRepository repository;

  Future<void> login({required String email, required String password}) async {
    state = const LoginState.loading();
    final response = await repository.login(email: email, password: password);
    state = response.fold(
          (error) => LoginState.unauthenticated(message: error),
          (response) => LoginState.authenticated(user: response),
    );
  }
}

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
      (ref) => LoginStateNotifier(ref.read(loginRepoProvider)),
);