import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lets_chat/model/user_model.dart';
part 'contacts_state.freezed.dart';

@freezed
class ContactState<T> with _$ContactState {
  const factory ContactState.initial() = _Initial;
  const factory ContactState.loading() = _Loading;
  const factory ContactState.contacts({required List<UserModel> users}) =_Contacts;
}