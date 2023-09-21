import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:step_up/view/screens/profile_screen.dart';

class AuthFunctions {
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

  static Future<UserCredential?> logout() async {
    await auth.signOut();
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // If user cancels the sign-in process
      if (googleUser == null) return null;

      // Obtain GoogleSignInAuthentication to use for Firebase authentication
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with Google credentials
      return await auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
