import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/custom_button.dart';
import 'package:qr_code/Core/utilis/stayles.dart';
import 'package:qr_code/Presentation/Screens/auth/login/Login_screen.dart';
import 'package:qr_code/Presentation/Widgets/custom_text_form.dart';

import '../../../../Core/utilis/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: const Divider(
                      height: 10,
                      indent: 100,
                      endIndent: 100,
                      color: kDividerColor,
                      thickness: 3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Create a new account",
                    style: Styles.textStyle161,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                      hinText: 'Enter Your name',
                      myController: username,
                      obscureText: false),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                      hinText: 'Enter Your email',
                      myController: email,
                      obscureText: false),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                      hinText: 'Enter Your password',
                      myController: password,
                      obscureText: false),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'SignUp',
                    onTap: () async {
                      if (formState.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          Navigator.of(context)
                              .pushReplacementNamed("qrScreen");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => LoginScreen()));
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
