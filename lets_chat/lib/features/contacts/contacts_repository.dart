import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/user_model.dart';

class ContactsRepository {

  final FirebaseFirestore firestore;
  ContactsRepository({required this.firestore});

  Future<Either<String, List<UserModel>>> getContactsList({required String currentUserEmail}) async {
      try {
        List<UserModel> usersList = [];
        var users = await FirebaseFirestore.instance.collection('user').get();
        for (var user in users.docs) {
          if (user.data()['email'] != currentUserEmail) {
            var userModel = UserModel(email: user.data()['email'], name: user.data()['name'], image: user.data()['image'], uid: user.data()['uid']);
            usersList.add(userModel);
          }
        }
        return right(usersList);
      } on FirebaseAuthException catch (e) {
        return left(e.message ?? 'Failed to fetch contacts..');
      } on Exception catch (ex) {
        return left(ex.toString());
      }
  }
}

final contactsRepoProvider = Provider<ContactsRepository>(
        (ref) => ContactsRepository(firestore: FirebaseFirestore.instance)
);