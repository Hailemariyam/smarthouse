// ignore: file_names

import 'package:flutter/material.dart';
import 'package:smart_home/auth/signup_auth_provider.dart';
import 'package:smart_home/components/my_textfield.dart';
import 'package:smart_home/screen/login_screen.dart';

class Register extends StatefulWidget {
  final Function()? onTap;

  const Register({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool Visible = true;
  bool isLoading = false;

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          onTap: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth >= 600 ? 64.0 : 32.0;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // Image.asset('assets/images/imageedit_4_9823257150.png'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Let\'s ',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'create ',
                        style: TextStyle(
                          color: Colors.indigo.shade500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'an account for you.',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    labelText: 'Email',
                    preffixIcon: const Icon(Icons.email),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    labelText: 'Password',
                    obscureText: Visible,
                    preffixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Visible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          Visible = !Visible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    labelText: 'Confirm Password',
                    obscureText: Visible,
                    preffixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Visible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          Visible = !Visible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                setState(() {
                                  isLoading = true;
                                });
                                var authProvider = SignupAuthProvider();
                                authProvider
                                    .signupValidation(
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  context: context,
                                  confirmPasswordController:
                                      confirmPasswordController,
                                )
                                    .whenComplete(() {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            // horizontal: screenWidth >= 600
                            //     ? 200
                            //     : 80, // Adjust button width as needed
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Set border radius to 8
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (!isLoading) const Text("Sign Up"),
                            if (isLoading) const CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: navigateToLogin,
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
