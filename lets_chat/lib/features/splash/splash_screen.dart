import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/splash/auth_provider.dart';
import '../home/home_screen.dart';

import '../login/login_screen.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    useEffect(() {
      Future.delayed(const Duration(seconds: 1), () {
        ref.read(authProvider.notifier).isUserLoggedIn();
      });
      return null;
    });

    ref.listen(authProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        loading: () => {},
        authenticated: (user) {
          if (user == null) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
          else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user)));
          }
        },
        unauthenticated: (message) =>
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message!),
                behavior: SnackBarBehavior.floating,
              ),
            ),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset('assets/images/lets_chat.png')),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Color(0xff928a8a),
            ),
          ],
        ),
      ),
    );
  }
}