import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/settings/profile_provider.dart';

import '../../constants/app_constants.dart';
import '../../model/user_model.dart';
import '../login/login_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {

  final UserModel user;
  const ProfileScreen(this.user, {Key? key}) : super(key: key);

  @override
  ProfileWidgetState createState() => ProfileWidgetState();

}

class ProfileWidgetState extends ConsumerState<ProfileScreen> {

  File? _photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(StringConstants.appTitle)
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: Sizes.dimen_50),
              SizedBox(
                  width: double.maxFinite,
                  height: Sizes.dimen_120,
                  child: SizedBox(
                    height: Sizes.dimen_80,
                    width: Sizes.dimen_80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          child: _photo != null ?
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Sizes.dimen_60),
                            child: Image.file(
                              _photo!,
                              width: Sizes.dimen_120,
                              height: Sizes.dimen_120,
                              fit: BoxFit.fill,
                            ),
                          ) : const Icon(Icons.person),
                        ),
                        Positioned(
                            bottom: Sizes.dimen_0,
                            right: Sizes.dimen_60,
                            child: RawMaterialButton(
                              onPressed: () {
                                showPicker(context);
                              },
                              elevation: 1.0,
                              fillColor: AppColors.white,
                              padding: const EdgeInsets.all(Sizes.dimen_10),
                              shape: const CircleBorder(),
                              child: const Icon(Icons.camera_alt_outlined, color: Colors.blue),
                            )),
                      ],
                    ),
                  )
              ),
              const SizedBox(height: Sizes.dimen_50),
              Text(
                widget.user.name,
                style: const TextStyle(
                    fontSize: Sizes.dimen_24,
                    color:Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
              ),
              ),
              const SizedBox(height: Sizes.dimen_20),
              Text(
                  widget.user.email,
                  style: const TextStyle(
                    fontSize: Sizes.dimen_18,
                    color:Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                  ),
              ),
              const SizedBox(height: Sizes.dimen_120),
              ElevatedButton(
                  child: const Text(StringConstants.logout,
                    style: TextStyle(fontSize: Sizes.dimen_20)),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (route) => false);
                  }
              ),
            ],
          ),
        )
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text(StringConstants.gallery),
                    onTap: () {
                      ref.read(profileProvider.notifier).imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text(StringConstants.camera),
                  onTap: () {
                    ref.read(profileProvider.notifier).imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}

/*class SettingsScreen extends StatefulWidget {

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

  UserModel user;
  SettingsScreen(this.user, {super.key});

}

class _SettingsScreenState extends State<SettingsScreen> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // ProfileRepository repository = ProfileRepository(storage: FirebaseStorage.instance);

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(StringConstants.appTitle)
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                  width: double.maxFinite,
                  height: 120,
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          child: _photo != null ?
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.file(
                              _photo!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.fill,
                            ),
                          ) : Icon(Icons.person),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 60,
                            child: RawMaterialButton(
                              onPressed: () {
                                showPicker(context);
                              },
                              elevation: 1.0,
                              fillColor: Color(0xFFF5F6F9),
                              child: Icon(Icons.camera_alt_outlined, color: Colors.blue),
                              padding: EdgeInsets.all(10.0),
                              shape: CircleBorder(),
                            )),
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                widget.user.name
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.user.email
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              SizedBox(
                height: 120,
              ),
              ElevatedButton(
                  child: const Text(StringConstants.logout,
                    style: TextStyle(fontSize: Sizes.dimen_20),),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (route) => false);
                  }
              ),
            ],
          ),
        )
    );
  }*/

 /* void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery(picker);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }*/

  /*Future uploadFile() async {
     // repository.uploadProfileImage(profileImageFile: _photo);
  }*/

