import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class ProfileRepository {

 // final FirebaseStorage storage;
 // ProfileRepository({required this.storage});

  Future<Either<String, bool>> uploadProfileImage({required File? profileImageFile}) async {
    try {
      final fileName = basename(profileImageFile!.path);
      print('fileName called.. - $fileName');
      final destination = 'profiles/$fileName';
      /*final ref = storage.ref(destination).child('file/');
      await ref.putFile(profileImageFile);
      final imageUrl = await storage.getDownloadURL();
      print('imageUrl - $imageUrl');*/
      return right(true);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}

final profileRepoProvider = Provider<ProfileRepository>(
      (ref) => ProfileRepository()
          // ProfileRepository(storage: FirebaseStorage.instance)
);
