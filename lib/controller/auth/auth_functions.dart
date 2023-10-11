import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:step_up/root_screen.dart';
import 'package:step_up/services/app_function/error_warning_dialog.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';

class AuthProvider with ChangeNotifier {
  static final auth = FirebaseAuth.instance;
  static final googleSignIn = GoogleSignIn();

  Future<void> signupFuct(
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

  Future<void> loginFuct({
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
        Navigator.pushReplacementNamed(context, RootScreen.rootName);
      } on FirebaseException catch (error) {
        debugPrint(error.toString());
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

  Future<void> logout(BuildContext context, mounted) async {
    await auth.signOut();
    if (!mounted) return null;
    Navigator.pushNamed(context, LoginScreen.routeName);
    notifyListeners();
  }

  Future<UserCredential?> signInWithGoogle() async {
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

  Future<void> faceboodAuth(BuildContext context) async {
    late UserCredential authResult;
    try {
      LoginResult loginResult = await FacebookAuth.instance.login(permissions: [
        'email',
        'public_profile',
        'user_birthday',
      ]);

      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        var userData = await FacebookAuth.instance.getUserData();

        var userEmail = userData['email'];
        print(userEmail.toString());

        authResult = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        if (authResult.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user!.uid)
              .set({
            'userId': authResult.user!.uid,
            'userEmail': userEmail,
            'userImageUrl': authResult.user!.photoURL,
            'createdAt': Timestamp.now(),
            'userName': authResult.user!.displayName,
            'userCart': [],
            'userWish': [],
          });
        }
      }
    } on FirebaseException catch (e) {
      if (!context.mounted) return;
      WarningErrorDialog.showErrorOrWarningDialog(
          context: context,
          subtitle: e.message.toString(),
          fct: () {},
          btnText: 'Back');
    } catch (e) {
      if (!context.mounted) return;
      WarningErrorDialog.showErrorOrWarningDialog(
          context: context,
          subtitle: e.toString(),
          fct: () {},
          btnText: 'Back');
    }
  }
}
