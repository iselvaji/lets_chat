import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.uploadStatus({required bool isSuccess}) =_UploadStatus;
}