import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/custom_button.dart';
import 'package:qr_code/Presentation/Widgets/Password_text_field.dart';
import 'package:qr_code/Presentation/Widgets/custom_text_form.dart';

import '../../Core/utilis/stayles.dart';

 class CustomLoginBody extends StatefulWidget {
  CustomLoginBody({Key? key}) : super(key: key);

  @override
  State<CustomLoginBody> createState() => _CustomLoginBodyState();
}

class _CustomLoginBodyState extends State<CustomLoginBody> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil("qrScreen", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
