import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/stayles.dart';

import '../../Core/utilis/assets.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: [
          const Center(
              child: Text(
            "Login",
            style: Styles.textStyle24,
          )),
          Positioned(
              height: 140,
              right: 80,
              left: 0.0,
              bottom: 10,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(600),
                ),
                child: Image.asset(
                  MyAssets.picB, width: 300, height: 400,
                  // 'images/pic2.png',
                ),
              )),
          Positioned(
            right: 0.0,
            left: 200,
            bottom: 15,
            height: 140,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(600),
              ),
              child: Image.asset(MyAssets.picA),
            ),
          ),
        ],
      ),
    );
  }
}
