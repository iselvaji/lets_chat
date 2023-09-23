import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/user_model.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.unauthenticated({String? message}) =_UnAuthenticatated;
  const factory LoginState.authenticated({required UserModel user}) =_Authenticated;
}