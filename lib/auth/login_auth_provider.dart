import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/components/route_page.dart';
import 'package:smart_home/pages/admin/admin_page.dart';
import 'package:smart_home/screen/dashboard_screen.dart';

class LoginAuthProvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regex = RegExp(LoginAuthProvider.pattern.toString());

  bool loading = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  UserCredential? userCredential;

  Future<void> loginPageValidation({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) async {
    loading = true;
    notifyListeners();

    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email address is empty"),
        ),
      );
    } else if (!regex.hasMatch(emailController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email address"),
        ),
      );
    } else if (passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is empty"),
        ),
      );
    } else if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be at least 6 characters long"),
        ),
      );
    } else {
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        //  loading = true;
        //   notifyListeners();

        var userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential!.user!.uid)
            .get();

        var userData = userDoc.data();
        var isAdmin = userData?['isAdmin'] ?? false;
        // var isAtheleticsCoach = userData?['isAtheleticsCoach'] ?? false;
        // var isAthelet = userData?['isAthelet'] ?? false;
        // var isFitnessCoach = userData?['isFitnessCoach'] ?? false;

        if (isAdmin) {
          // ignore: use_build_context_synchronously
          await RoutingPage.gotonext(
            context: context,
            navigateTo: const HomeAdmin(),
          );
        }
        //  else if (isAtheleticsCoach) {
        //   await RoutingPage.gotonext(
        //     context: context,
        //     navigateTo: const AtheletCoachHome(),
        //   );
        // } else if (isFitnessCoach) {
        //   await RoutingPage.gotonext(
        //     context: context,
        //     navigateTo: const FitnessCoachHome(),
        //   );
        // } else if (isAthelet) {
        //   await RoutingPage.gotonext(
        //     context: context,
        //     navigateTo: const AtheleticsHome(),
        //   );
        // }
        else {
          await RoutingPage.gotonext(
            context: context,
            navigateTo: DashboardScreen(),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User not found. Please check your email."),
            ),
          );
        } else if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Incorrect password. Please try again."),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("An error occurred. Please try again later."),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("An error occurred. Please try again later."),
          ),
        );
      }
    }

    loading = false;
    notifyListeners();
  }
}
