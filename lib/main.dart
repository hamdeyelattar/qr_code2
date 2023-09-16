import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code/Presentation/Screens/Qr_Screen/qr_screen.dart';
import 'package:qr_code/Presentation/Screens/scan_screen/scan_screen.dart';
import 'package:qr_code/firebase_options.dart';

import 'Presentation/Screens/auth/Login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const QrApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class QrApp extends StatelessWidget {
  const QrApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        "loginScreen": (context) => LoginScreen(),
        "qrScreen": (context) => QrScreen(),
        "ScanScreen": (context) => ScanScreen(),
        // "editCategory": (context) => EditCategory(),
      },
    );
  }
}
