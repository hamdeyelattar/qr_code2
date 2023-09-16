import 'package:flutter/material.dart';
import 'package:qr_code/Presentation/Widgets/custom_login_body.dart';
import 'package:qr_code/Presentation/Widgets/custom_stack.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const CustomStack(),
              const SizedBox(height: 50),
              CustomLoginBody(),

            ],
          ),
        ],
      ),
    );
  }
}
