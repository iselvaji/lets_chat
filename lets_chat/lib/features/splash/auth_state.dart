import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/user_model.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthenticated({String? message}) =_UnAuthenticatated;
  const factory AuthState.authenticated({required UserModel? user}) =_Authenticated;
}