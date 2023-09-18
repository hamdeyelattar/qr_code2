import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/stayles.dart';
import 'package:qr_code/Presentation/Screens/Qr_Screen/qr_screen.dart';
import 'package:qr_code/Presentation/Screens/result_scan_screen/result_screen.dart';

import 'package:qr_code/Presentation/Widgets/custom_stack.dart';
import '../../../../Core/utilis/custom_button.dart';
import '../../../Widgets/Password_text_field.dart';
import '../../../Widgets/custom_text_form.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: ListView(
          children: [
            Column(
              children: [
                CustomStack(),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hinText: "Enter Your email",
                        myController: email,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextFormField(
                        hinText: "Enter Your password",
                        myController: password,
                        obscureText: true,
                        validator: (val) {
                          if (val == "") {
                            return "can't to be empty";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          alignment: Alignment.topRight,
                          child: const Text(
                            "Forget Password",
                            style: Styles.textStyle14,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: 'Login',
                          onTap: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "qrScreen", (route) => false);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          }),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don't have an account ?",
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                      },
                      child: const Text(
                        "Register",
                        style: Styles.textStyle141,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
