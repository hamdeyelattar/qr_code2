import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {

  PasswordTextFormField({
    Key? key,
    required this.hinText,
    required this.myController,
    this.validator,
    required this.obscureText,
    this.formKey,
  }) : super(key: key);
  final String hinText;
  final String? Function(String?)? validator;
  final TextEditingController myController;
  final bool? obscureText;
  final Key? formKey;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formState,
      obscureText: obscureText,
      validator: (val) {
        if (val == "") {
          return "can't to be empty";
        }
      },
      controller: password,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        hintText: widget.hinText,
        hintStyle: const TextStyle(color: Colors.black26, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}
