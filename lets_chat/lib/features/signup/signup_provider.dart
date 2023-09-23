import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/signup/signup_repository.dart';
import 'package:lets_chat/features/signup/signup_state.dart';

class SignUpStateNotifier extends StateNotifier<SignupState> {

  SignUpStateNotifier(this.repository) : super(const SignupState.initial());
  final SignupRepository repository;

  Future<void> signUp({required String email, required String password, required String userName}) async {
     state = const SignupState.loading();
     final response = await repository.signUp(email: email, password: password, userName: userName);
     state = response.fold(
          (error) => SignupState.unregistered(message: error),
          (response) => const SignupState.registered()
     );
  }
}

final signUpProvider = StateNotifierProvider<SignUpStateNotifier, SignupState>(
      (ref) => SignUpStateNotifier(ref.read(signUpRepoProvider)),
);