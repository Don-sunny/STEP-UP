import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';

import 'package:step_up/view/screens/auth/sign_up_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';
import 'package:step_up/view/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Colors.green,
              ),
              useMaterial3: false,
            ),
            home: const SplashScreen(),
            routes: {
              SignupScreen.routName: (context) => const SignupScreen(),
              UserProfileScreen.rootName: (context) => UserProfileScreen(),
              LoginScreen.routeName: (context) => const LoginScreen()
            },
          );
        });
  }
}
