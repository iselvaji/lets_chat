import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/constants/app_constants.dart';
import 'package:lets_chat/features/signup/signup_provider.dart';

import '../login/login_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends ConsumerState<SignUpScreen> with InputValidationMixin {

  var formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    String userName = '';
    String userEmail = '';
    String password = '';

    showSuccessAlert() {
      showDialog(context: context,
          builder: (BuildContext context){
            return  AlertDialog(
              content: const Text(StringConstants.sign_up_success),
              actions: [
                ElevatedButton(onPressed: (){
                   Navigator.of(context).pop();
                }, child: const Text(StringConstants.ok))
              ],
            );
          }
      );
    }

    var isLoading = ref.watch(signUpProvider).maybeWhen(orElse: () => false, loading: () => true);

    ref.listen(signUpProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          registered : () {
            showSuccessAlert();
          },
          unregistered : (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message!),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
      );
    });

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            }, icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(StringConstants.appTitle),
        ),
        body: isLoading ? const Center(child: CircularProgressIndicator()) :
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: StringConstants.username
                        ),
                        validator: (userName) {
                          if (isUserNameValid(userName!)) {
                            return null;
                          } else {
                            return StringConstants.validation_msg_username;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => userName = value,
                      ),
                      const SizedBox(height: Sizes.dimen_24),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: StringConstants.email
                        ),
                        validator: (email) {
                          if (isEmailValid(email!)) {
                            return null;
                          } else {
                            return StringConstants.validation_msg_email;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => userEmail = value,
                      ),
                      const SizedBox(height: Sizes.dimen_24),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: StringConstants.password
                        ),
                        obscureText: true,
                        validator: (password) {
                          if (isPasswordValid(password!)) {
                            return null;
                          } else {
                            return StringConstants.validation_msg_password;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => password = value,
                      ),
                      const SizedBox(height: Sizes.dimen_30),
                      ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState?.validate() == true) {
                              ref.read(signUpProvider.notifier).signUp(
                                  email: userEmail,
                                  password: password,
                                  userName: userName
                              );
                            }
                          },
                          child: const Text(StringConstants.signup)
                      ),
                      const SizedBox(height: Sizes.dimen_30)
                    ],
                  ),
                ),
              ),
            )
        ));
  }
}

mixin InputValidationMixin {
  bool isUserNameValid(String username) => username.length >= 3;
  bool isPasswordValid(String password) => password.length >= 6;
  bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}

