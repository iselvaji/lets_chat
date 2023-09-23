import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/user_model.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = _Loading;
  const factory SignupState.unregistered({String? message}) =_Unregistered;
  const factory SignupState.registered() =_Registered;
}