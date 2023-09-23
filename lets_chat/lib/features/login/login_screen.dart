import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/login/login_provider.dart';

import '../../constants/app_constants.dart';
import '../../features/signup/signup_screen.dart';
import '../home/home_screen.dart';

class _LoginState extends ConsumerState<LoginScreen> with InputValidationMixin {

  var formGlobalKey = GlobalKey<FormState>();

  String password = '';
  String userEmail = '';

  @override
  Widget build(BuildContext context) {

    var isLoading = ref.watch(loginProvider).maybeWhen(orElse: () => false, loading: () => true);

    ref.listen(loginProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          authenticated : (user) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen(user)));
          },
          unauthenticated : (message) {
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
          title: const Text(StringConstants.appTitle),
        ),
        body: isLoading ? const Center(child: CircularProgressIndicator(key: Key(StringConstants.loading))) :
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    const SizedBox(height: Sizes.dimen_24),
                    TextFormField(
                      key: const Key(StringConstants.email),
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
                        key: const Key(StringConstants.password),
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
                    const SizedBox(height: Sizes.dimen_50),
                    ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState != null && !isLoading) {
                            if (formGlobalKey.currentState?.validate() == true) {
                              // formGlobalKey.currentState?.save();
                              ref.read(loginProvider.notifier).login(
                                email: userEmail,
                                password: password,
                              );
                            }
                          }
                        },
                        child: const Text(
                            StringConstants.login,
                            style: TextStyle(fontSize: Sizes.dimen_18)
                        )
                    ),
                    const SizedBox(height: Sizes.dimen_30),
                    TextButton(
                      child: const Text(
                          StringConstants.signup,
                          style: TextStyle(fontSize: Sizes.dimen_18, color: AppColors.orangeWeb)
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                      },
                    ),
                    const SizedBox(height: Sizes.dimen_30)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

class LoginScreen extends ConsumerStatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;
  bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
