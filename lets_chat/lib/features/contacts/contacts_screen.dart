import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constants/app_constants.dart';
import '../../model/user_model.dart';
import 'package:flutter/material.dart';
import '../chat/chat_screen.dart';
import 'contacts_provider.dart';

class ContactsScreen extends ConsumerStatefulWidget {

  final UserModel user;
  const ContactsScreen(this.user, {Key? key}) : super(key: key);

  @override
  ContactsWidgetState createState() => ContactsWidgetState();

}

class ContactsWidgetState extends ConsumerState<ContactsScreen> {

  @override
  void initState() {
      super.initState();
      // fetch data only after first frame
      WidgetsBinding.instance.endOfFrame.then((_) {
        if (mounted) {
          ref.read(contactsProvider.notifier).getContactsList(emailId : widget.user.email);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(contactsProvider).when(
        contacts : (users) {
          return Scaffold(
              appBar: AppBar(backgroundColor: Colors.blue, title: const Text(StringConstants.appTitle)),
              body: users.isEmpty ? const Center(child: Text(StringConstants.contacts_empty)) :
              Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: users.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(Sizes.dimen_60),
                                    child: Container(
                                      margin: const EdgeInsets.only(),
                                      width: Sizes.dimen_60,
                                      height: Sizes.dimen_64,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ProfilePicture(
                                        name: users[index].name,
                                        radius: Sizes.dimen_24,
                                        fontsize: Sizes.dimen_20,
                                        random: true,
                                      ),
                                    ),
                                  ),
                                  title: Text(users[index].name),
                                  subtitle: Text(users[index].email),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatScreen(
                                                widget.user,
                                                users[index].uid,
                                                users[index].name
                                            )
                                        )
                                    );
                                  }
                              );
                            })
                    )
                  ]
              )
          );
        },initial: () {
            return const Center(child: CircularProgressIndicator());
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }
        );
    }
}