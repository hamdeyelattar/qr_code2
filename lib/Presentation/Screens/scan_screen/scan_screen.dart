import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/constants.dart';
import 'package:qr_code/Core/utilis/custom_button.dart';
import 'package:qr_code/Core/utilis/stayles.dart';
import 'package:qr_code/Core/utilis/svg_icons.dart';
import 'package:qr_code/Presentation/Screens/Qr_Screen/qr_screen.dart';

import '../../Widgets/custom_field.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrScreen()));
                    },
                    icon: const SvgIcon(
                      svg: 'arrow',
                      size: 28,
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Column(
              children: [
                Text(
                  "Scanning Result",
                  style: Styles.textStyle161,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Proreader will Keep your last 10 days history "
                  " to keep your all scared history please"
                  "purched our pro package",
                  style: Styles.textStyle12,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFiled(),
            CustomFiled(),
            CustomFiled(),

            // CustomFiled(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: "Send",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
