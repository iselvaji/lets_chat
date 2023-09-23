import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/contacts/contacts_repository.dart';
import 'package:lets_chat/features/contacts/contacts_state.dart';
import 'package:lets_chat/model/user_model.dart';

class ContactStateNotifier extends StateNotifier<ContactState> {
  ContactStateNotifier(this.repository) : super(const ContactState.initial());
  final ContactsRepository repository;

  Future<void> getContactsList({required String emailId}) async {
    state = const ContactState.loading();
    final response = await repository.getContactsList(currentUserEmail : emailId);
    var users = List.empty();
    if(response.isRight()) {
      users = response.getOrElse(() => List.empty());
    }
    state = ContactState.contacts(users: users as List<UserModel>);
  }
}

final contactsProvider = StateNotifierProvider<ContactStateNotifier, ContactState>(
      (ref) => ContactStateNotifier(ref.read(contactsRepoProvider)),
);