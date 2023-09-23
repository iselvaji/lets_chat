import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets_chat/features/settings/profile_repository.dart';
import 'package:lets_chat/features/settings/profile_state.dart';

class ProfileStateNotifier extends StateNotifier<ProfileState> {

  ProfileStateNotifier(this.repository) : super(const ProfileState.initial());
  final ProfileRepository repository;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> uploadFile({required File? profileImageFile}) async {
    state = const ProfileState.loading();
    final response = await repository.uploadProfileImage(profileImageFile: profileImageFile);
    var isUploadSuccess = false;
    if(response.isRight()) {
      isUploadSuccess = true;
    }
    state = ProfileState.uploadStatus(isSuccess: isUploadSuccess);
  }

  Future<File?> imgFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> imgFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}

final profileProvider = StateNotifierProvider<ProfileStateNotifier, ProfileState>(
      (ref) => ProfileStateNotifier(ref.read(profileRepoProvider)),
);