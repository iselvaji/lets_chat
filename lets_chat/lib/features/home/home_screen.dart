import 'package:flutter/material.dart';
import 'package:lets_chat/constants/app_constants.dart';
import 'package:lets_chat/features/contacts/contacts_screen.dart';
import 'package:lets_chat/features/settings/profile_screen.dart';
import '../../model/user_model.dart';
import '../chatrooms/chat_rooms.dart';

class HomeScreen extends StatefulWidget {

  UserModel user;
  HomeScreen(this.user, {super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    UserModel user = widget.user;
    switch (pos) {
      case 0:
        return ChatRoomsScreen(user);
      case 1:
        return ContactsScreen(user);
      case 2:
        return ProfileScreen(user);
      default:
        return const Text("Error");
    }
  }

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: Colors.green,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: StringConstants.chat,
            icon: Icon(Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            label: StringConstants.contacts,
            icon: Icon(Icons.contacts),
          ),
          BottomNavigationBarItem(
            label: StringConstants.profile,
            icon: Icon(Icons.supervised_user_circle),
          ),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    );
  }
}
