// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/components/route_page.dart';
import 'package:smart_home/screen/dashboard_screen.dart';

class SignupAuthProvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regex = RegExp(SignupAuthProvider.pattern.toString());
  UserCredential? userCredential;
  bool loading = true;

  signupValidation(
      {required TextEditingController? confirmPasswordController,
      required TextEditingController? emailController,
      required TextEditingController? passwordController,
      required BuildContext context}) async {
    // if (fullName!.text.trim().isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Please,enter your full name!"),
    //     ),
    //   );
    //   return;
    // } else
    if (emailController!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please,enter your email address!"),
        ),
      );
      return;
    } else if (!regex.hasMatch(emailController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(" Invalid Email adress "),
        ),
      );
      return;
    } else if (passwordController!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please,enter your Password!"),
        ),
      );
      return;
    } else if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be 6"),
        ),
      );
      return;
    } else {
      try {
        loading = true;
        notifyListeners();
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        loading = true;
        notifyListeners();
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential!.user!.uid)
            .set(
          {
            // "fullname": fullName.text,
            "email": emailController.text,
            "password": passwordController.text,
            "userUid": userCredential!.user!.uid,
            "isAdmin": false,
            // "isAtheleticsCoach": false,
            // "isFitnessCoach": false,
          },
        ).then((value) {
          loading = false;
          notifyListeners();
          RoutingPage.gotonext(
            context: context,
            navigateTo: DashboardScreen(),
          );
        });
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();
        if (e.code == "Weak password") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Weak password"),
            ),
          );
        } else if (e.code == "Email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email-already-in-use"),
            ),
          );
        }
      }
    }
  }
}
