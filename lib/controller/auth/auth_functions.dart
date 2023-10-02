import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';

class AuthFunctions with ChangeNotifier {
  static final auth = FirebaseAuth.instance;
  static final googleSignIn = GoogleSignIn();

  static Future<void> signupFuct(
      {TextEditingController? emailController,
      TextEditingController? passwordController,
      final formkey,
      required BuildContext context,
      required mounted}) async {
    final isValid = formkey.currentState!.validate();

    if (isValid) {
      try {
        await auth.createUserWithEmailAndPassword(
          email: emailController!.text.trim(),
          password: passwordController!.text.trim(),
        );
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, UserProfileScreen.rootName);
      } on FirebaseException catch (error) {
        debugPrint(error.toString());
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

  static Future<void> loginFuct({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    final formkey,
    required BuildContext context,
    required mounted,
  }) async {
    formkey.currentState!.validate();

    final isValid = formkey.currentState!.validate();

    if (isValid) {
      try {
        await auth.signInWithEmailAndPassword(
          email: emailController!.text.trim(),
          password: passwordController!.text.trim(),
        );
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, UserProfileScreen.rootName);
      } on FirebaseException catch (error) {
        debugPrint(error.toString());
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

  Future<UserCredential?> logout(BuildContext context, mounted) async {
    await auth.signOut();
    if (!mounted) return null;
    Navigator.pushNamed(context, LoginScreen.routeName);
    notifyListeners();
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
