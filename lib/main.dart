import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code/Presentation/Screens/Qr_Screen/qr_screen.dart';
import 'package:qr_code/Presentation/Screens/result_scan_screen/result_screen.dart';
import 'package:qr_code/firebase_options.dart';

import 'Presentation/Screens/auth/login/Login_screen.dart';

void main() async {
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

class QrApp extends StatefulWidget {
  const QrApp({super.key});

  @override
  State<QrApp> createState() => _QrAppState();
}

class _QrAppState extends State<QrApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('****User is currently signed out!********');
      } else {
        print('*******User is signed in!******');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home:(FirebaseAuth.instance.currentUser != null &&
      //     FirebaseAuth.instance.currentUser!.emailVerified)
      //     ? QrScreen()
      //     : LoginScreen(),
      routes: {
        "loginScreen": (context) => LoginScreen(),
        "qrScreen": (context) => QrScreen(),
        "resultScreen": (context) => ResultScreen(),
      },
    );
  }
}
