import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:step_up/controller/auth/auth_functions.dart';
import 'package:step_up/root_screen.dart';
import 'package:step_up/util/constants/validator.dart';
import 'package:step_up/util/widgets/circle_widget.dart';
import 'package:step_up/util/widgets/diverder_widget.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';
import 'package:step_up/util/widgets/text_form_title_widget.dart';
import 'package:step_up/view/screens/auth/login_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routName = '/SignupScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    const SizedBox(
                      height: 20,
                    ),
                    const TextFormTitleWidget(
                      name: 'Email Id',
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'sample@gmail.com',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextFormTitleWidget(
                      name: 'Password',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'password',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Theme.of(context).colorScheme.error),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            validator: (value) {
                              return MyValidators.passwordValidator(value);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: rePasswordController,
                            decoration: InputDecoration(
                              hintText: 'Re-password',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Theme.of(context).colorScheme.error),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            validator: (value) {
                              return MyValidators.repeatPasswordValidator(
                                value: value,
                                password: passwordController.text.trim(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SubTitleWidget(
                            fontSize: 20,
                            text: 'By clicking Sign up you are in agreement of',
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const SubTitleWidget(
                              fontSize: 20,
                              text: 'Terms & Conditions',
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            await AuthFunctions.signupFuct(
                              context: context,
                              emailController: emailController,
                              passwordController: passwordController,
                              formkey: _formkey,
                              mounted: mounted,
                            );
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
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
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleWiget(
                      color: Colors.blue,
                      icon: Icons.facebook,
                      iconSize: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        UserCredential? userCredential =
                            await AuthFunctions.signInWithGoogle();
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
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SubTitleWidget(
                      text: "Already have an account?",
                      fontSize: 18,
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
                            fontSize: 18,
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
