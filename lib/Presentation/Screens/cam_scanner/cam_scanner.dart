// // import 'dart:html';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code/Core/utilis/constants.dart';
// import 'package:qr_code/Core/utilis/stayles.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// import '../../../Core/utilis/custom_button.dart';
// import '../../../Core/utilis/svg_icons.dart';
//
// class CamScanner extends StatefulWidget {
//   const CamScanner({Key? key}) : super(key: key);
//
//   @override
//   State<CamScanner> createState() => _CamScannerState();
// }
//
// class _CamScannerState extends State<CamScanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 10),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//             child: const Divider(
//               height: 10,
//               indent: 100,
//               endIndent: 100,
//               color: kDividerColor,
//               thickness: 3,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                   onPressed: () {},
//                   icon: const SvgIcon(
//                     svg: 'menu',
//                     size: 28,
//                   )),
//             ],
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           const Column(
//             children: [
//               Text(
//                 "Scan OR code",
//                 style: Styles.textStyle161,
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 "Place qr code inside the frame to scan please "
//                 "avoid shake to get results quickly",
//                 style: Styles.textStyle12,
//                 textAlign: TextAlign.center,
//                 overflow: TextOverflow.clip,
//                 maxLines: 2,
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//               height: 50,
//               width: 50,
//               child: QRView(
//                 key: qrKey,
//                 onQRViewCreated: _onQRViewCreated,
//                 overlay: QrScannerOverlayShape(
//                   borderRadius: 20,
//                   borderLength: 20,
//                   borderWidth: 10,
//                   cutOutSize: MediaQuery.of(context).size.width * 0.6,
//                   cutOutBottomOffset: 1,
//                   borderColor: kPrimaryColor,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: Container(
//               height: 200,
//               child: (result != null)
//                   ? Text('Barcode Type: ${describeEnum(result!.format)} '
//                       '  Data: ${result!.code}')
//                   : Column(
//                       children: [
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SvgIcon(
//                               svg: 'pic',
//                               size: 30,
//                             ),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             SvgIcon(
//                               svg: 'pic2',
//                               size: 30,
//                             ),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             SvgIcon(
//                               svg: 'pic3',
//                               size: 30,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 30),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: CustomButton(
//                             text: "Place Camera Code",
//                             onTap: () {
//                               Navigator.of(context).pushNamedAndRemoveUntil(
//                                   "ScanScreen", (route) => false);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
// }
