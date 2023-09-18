// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code/Core/utilis/custom_button.dart';
// import 'package:qr_code/Presentation/Widgets/Password_text_field.dart';
// import 'package:qr_code/Presentation/Widgets/custom_text_form.dart';
//
// import '../../Core/utilis/stayles.dart';
//
// class CustomLoginBody extends StatefulWidget {
//   CustomLoginBody({Key? key}) : super(key: key);
//
//   @override
//   State<CustomLoginBody> createState() => _CustomLoginBodyState();
// }
//
// class _CustomLoginBodyState extends State<CustomLoginBody> {
//   TextEditingController email = TextEditingController();
//
//   TextEditingController password = TextEditingController();
//
//   GlobalKey<FormState> formState = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     email.dispose();
//     password.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           CustomTextFormField(
//             hinText: "Enter Your email",
//             myController: email,
//             obscureText: false,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           PasswordTextFormField(
//             hinText: "Enter Your password",
//             myController: password,
//             obscureText: true,
//             validator: (val) {
//               if (val == "") {
//                 return "can't to be empty";
//               }
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//               padding: const EdgeInsets.only(right: 10),
//               alignment: Alignment.topRight,
//               child: const Text(
//                 "Forget Password",
//                 style: Styles.textStyle14,
//               )),
//           const SizedBox(
//             height: 20,
//           ),
//           CustomButton(
//             text: 'Login',
//             onTap: () async {
//               if (formState.currentState!.validate()) {
//                 try {
//                   final credential =
//                       await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: email.text,
//                     password: password.text,
//                   );
//                   Navigator.of(context)
//                       .pushNamedAndRemoveUntil("qrScreen", (route) => false);
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'user-not-found') {
//                     print('No user found for that email.');
//                   } else if (e.code == 'wrong-password') {
//                     print('Wrong password provided for that user.');
//                   }
//                 }
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
