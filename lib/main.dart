import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_up/controller/auth/auth_functions.dart';
import 'package:step_up/controller/providers/theme_provider.dart';
import 'package:step_up/root_screen.dart';
import 'package:step_up/util/constants/theme_data.dart';
import 'package:step_up/view/screens/address_screen.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';

import 'package:step_up/view/screens/auth/sign_up_screen.dart';
import 'package:step_up/view/screens/congrats_screen.dart';
import 'package:step_up/view/screens/home_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';
import 'package:step_up/view/screens/search_screen.dart';

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return AuthFunctions();
              }),
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              })
            ],
            child:
                Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const RootScreen(),
                routes: {
                  SignupScreen.routName: (context) => const SignupScreen(),
                  UserProfileScreen.rootName: (context) => UserProfileScreen(),
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  SearchScreen.rootName: (context) => SearchScreen(),
                },
              );
            }),
          );
        });
  }
}
