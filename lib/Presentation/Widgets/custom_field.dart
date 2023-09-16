import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/svg_icons.dart';

import '../../Core/utilis/constants.dart';
import '../../Core/utilis/stayles.dart';

class CustomFiled extends StatelessWidget {
  const CustomFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11), color: kFieldColor),
        width: 220,
        height: 75,
        child: const Row(
          children: [
            SvgIcon(
              svg: 'file',
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "7E0918FF",
              style: Styles.textStyle14,
            )
          ],
        ),
      ),
    );
  }
}
