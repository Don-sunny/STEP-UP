import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:step_up/root_screen.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    navigateTo();
    super.initState();
  }

  void navigateTo() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    if (!mounted) return;
    if (auth.currentUser?.uid != null) {
      Navigator.pushReplacementNamed(
        context,
        RootScreen.rootName,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        LoginScreen.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is splash screen'),
      ),
    );
  }
}
