import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:step_up/controller/auth/auth_functions.dart';
import 'package:step_up/root_screen.dart';
import 'package:step_up/services/app_function/error_warning_dialog.dart';
import 'package:step_up/services/image_picker_function.dart';
import 'package:step_up/util/constants/validator.dart';
import 'package:step_up/util/widgets/circle_widget.dart';
import 'package:step_up/util/widgets/diverder_widget.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';
import 'package:step_up/util/widgets/text_form_title_widget.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';
import 'package:step_up/view/screens/auth/widgets/image_picker.dart';

class SignupScreen extends StatefulWidget {
  static const routName = '/SignupScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  XFile? _pickedImage;
  String? _userImageUrl;

  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  final TextEditingController nameEditingController = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future<void> localImagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFunctioins.imagePickerDialog(
        context: context,
        cameraFun: () async {
          _pickedImage =
              await imagePicker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
        galleryFun: () async {
          await imagePicker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        removeFun: () {
          setState(() {
            _pickedImage = null;
          });
        });
  }

  Future<void> _registerFun() async {
    final isValid = _formkey.currentState!.validate();
    // Focus.of(context).unfocus();
    if (_pickedImage == null) {
      WarningErrorDialog.showErrorOrWarningDialog(
          context: context,
          subtitle: 'Make  sure to pick up an image',
          btnText: 'Pick Image',
          fct: () {});
      return;
    }
    if (isValid) {
      try {
        await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        final User? user = auth.currentUser;
        final String uid = user!.uid;
        final ref = FirebaseStorage.instance
            .ref()
            .child('userImages')
            .child('$uid.jpg');
        await ref.putFile(File(_pickedImage!.path));
        _userImageUrl = await ref.getDownloadURL();
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'userId': uid,
          'userName': nameEditingController.text.trim(),
          'userImageUrl': _userImageUrl,
          'userEmail': emailController.text.trim(),
          'createdAt': Timestamp.now(),
          'userWish': [],
          'userCart': [],
        });
        if (!mounted) return;
        Navigator.pushNamed(context, RootScreen.rootName);
      } on FirebaseAuthException catch (e) {
        WarningErrorDialog.showErrorOrWarningDialog(
          btnText: 'Back',
          context: context,
          subtitle: e.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await WarningErrorDialog.showErrorOrWarningDialog(
          btnText: 'Back',
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Signup',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: size.width * 0.3,
                        width: size.width * 0.3,
                        child: PickImageWidget(
                          pickedImage: _pickedImage,
                          function: () async {
                            await localImagePicker();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const TextFormTitleWidget(
                      name: 'Name',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      controller: nameEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Full name',
                      ),
                      validator: (value) {
                        return MyValidators.displayNamevalidator(value);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const TextFormTitleWidget(
                      name: 'Email Id',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'sample@gmail.com',
                      ),
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextFormTitleWidget(
                                name: 'Password',
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              TextFormField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  hintText: 'password',
                                ),
                                validator: (value) {
                                  return MyValidators.passwordValidator(value);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextFormTitleWidget(
                                name: 'Re-Password',
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              TextFormField(
                                controller: rePasswordController,
                                decoration: const InputDecoration(
                                  hintText: 'Re-password',
                                ),
                                validator: (value) {
                                  return MyValidators.repeatPasswordValidator(
                                    value: value,
                                    password: passwordController.text.trim(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SubTitleWidget(
                            fontSize: 15,
                            text: 'By clicking Sign up you are in agreement of',
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {},
                            child: SubTitleWidget(
                              fontSize: 15,
                              text: 'Terms & Conditions',
                              color: Colors.blue[300]!,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: size.width * 0.85,
                        height: size.height * 0.05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            await _registerFun();
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Row(
                  children: [
                    DiverderWidget(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DiverderWidget()
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await authProvider.faceboodAuth(context);
                        if (!mounted) return;
                        Navigator.pushNamed(context, RootScreen.rootName);
                      },
                      child: const CircleWiget(
                        color: Colors.blue,
                        icon: Icons.facebook,
                        iconSize: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        UserCredential? userCredential =
                            await authProvider.signInWithGoogle();
                        if (userCredential != null) {
                          if (!mounted) return;
                          Navigator.pushNamed(
                            context,
                            RootScreen.rootName,
                          );
                          print('user sigined in');
                        }
                      },
                      child: const CircleWiget(
                        icon: Ionicons.logo_google,
                        color: Colors.red,
                      ),
                    ),
                    const CircleWiget(
                      icon: Ionicons.logo_twitter,
                      color: Color.fromARGB(255, 19, 200, 232),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SubTitleWidget(
                      text: "Already have an account?",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
