// import 'dart:html';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/Core/utilis/constants.dart';
import 'package:qr_code/Core/utilis/stayles.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerCopmonents extends StatefulWidget {
  const ScannerCopmonents({Key? key}) : super(key: key);

  @override
  State<ScannerCopmonents> createState() => _ScannerCopmonentsState();
}

class _ScannerCopmonentsState extends State<ScannerCopmonents> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 80,right: 80),
        child: Center(
          child: Column(

            children: [
              Expanded(
                flex:8,
                child: QRView(
                  key: qrKey,

                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: kPrimaryColor,
                    borderRadius: 20,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.6,

                    cutOutBottomOffset: 1,

                  ),
                ),
              ),
              Expanded(
                //flex:1,
                child: Center(
                  child: (result != null)
                      ? Text('Barcode Type: ${describeEnum(result!.format)} '
                          '  Data: ${result!.code}') :null
                      // : Container(
                      //     height: 50,
                      //     width: 150,
                      //     decoration: BoxDecoration(
                      //       color: kPrimaryColor,
                      //       borderRadius: BorderRadius.circular(16),
                      //     ),
                      //     // child: const Center(
                      //     //   child: Text(
                      //     //     'Scan a code',
                      //     //     style: Styles.textStyle16,
                      //     //   ),
                      //     // ),
                      //   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
