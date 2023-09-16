import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/constants.dart';
import 'package:qr_code/Core/utilis/stayles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, this.onTap});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 250,
        height: 58,
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle16,
          ),
        ),
      ),
    );
  }
}
