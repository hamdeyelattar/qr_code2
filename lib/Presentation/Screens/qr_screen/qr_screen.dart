import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/constants.dart';
import 'package:qr_code/Core/utilis/custom_button.dart';
import 'package:qr_code/Core/utilis/stayles.dart';
import 'package:qr_code/Core/utilis/svg_icons.dart';
import 'package:qr_code/Presentation/components/read_scanner/scanner_components.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const SvgIcon(
                      svg: 'menu',
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
                  "Scan OR code",
                  style: Styles.textStyle161,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Place qr code inside the frame to scan please "
                  "avoid shake to get results quickly",
                  style: Styles.textStyle12,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
       Container(
         height: 200,
         child: Stack(
           children: [
             Container(
               child: InkWell(
                 onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => ScannerCopmonents()));
                 },
                 child: const SvgIcon(
                   svg: 'qr_code',
                   size: 200,
                 ),
               ),
             ),
             Container(child: ScannerCopmonents()),
           ],
         ),
       ),
            const SizedBox(
              height: 70,
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgIcon(
                    svg: 'pic',
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgIcon(
                    svg: 'pic2',
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgIcon(
                    svg: 'pic3',
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: "Place Camera Code",
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("resultScreen", (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
