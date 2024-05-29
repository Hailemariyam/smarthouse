// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:smart_home/auth/login_auth_provider.dart';
// import 'package:smart_home/components/my_textfield.dart';
// import 'package:smart_home/screen/signUp_screen.dart';

// class Login extends StatefulWidget {
//   final Function()? onTap;

//   const Login({
//     Key? key,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool Visible = true;
//   bool isLoading = false;

//   // sign user in method
//   void signUserIn() async {
//     // show loading circle
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );

//     try {
//       // Call the sign-in method with the email address
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       // Pop the loading circle
//       Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       // Pop the loading circle
//       Navigator.pop(context);
//       // Show error message
//       showErrorMessage(e.code);
//     }
//   }

//   // forgot password?

//   void forgotPassword() async {
//     // Show loading circle
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );

//     try {
//       // Send a password reset email to the user's email address
//       await FirebaseAuth.instance.sendPasswordResetEmail(
//         email: emailController.text,
//       );
//       // Pop the loading circle
//       Navigator.pop(context);

//       // Show success message
//       showDialog(
//         context: context,
//         builder: (context) {
//           return const AlertDialog(
//             backgroundColor: Colors.deepPurple,
//             title: Center(
//               child: Text(
//                 'Dear, user we have sent password resetter link to your email,please check your email.',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         },
//       );
//     } on FirebaseAuthException catch (e) {
//       // Pop the loading circle
//       Navigator.pop(context);

//       // Show error message
//       showErrorMessage(e.code);
//     }
//   }

//   // error message to user
//   void showErrorMessage(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.black,
//           title: Center(
//             child: Text(
//               message,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void navigateToRegister() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Register(onTap: navigateToLogin),
//       ),
//     );
//   }

//   void navigateToLogin() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Login(onTap: null),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: Colors.black87,
//         body: SafeArea(
//       child: Container(
//         // margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           color: Colors.white, // Replace with your desired background color
//           borderRadius: BorderRadius.circular(
//               16), // Replace 10 with your desired border radius
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 15),

//                 // logo
//                 // Image.asset('assets/images/imageedit_4_9823257150.png'),

//                 const SizedBox(height: 15),

//                 // welcome back, you've been missed!
//                 Text(
//                   'welcome back!',
//                   style: TextStyle(
//                     color: Colors.grey[700],
//                     fontSize: 16,
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 // email textfield
//                 MyTextField(
//                   controller: emailController,
//                   hintText: 'Email',
//                   labelText: 'Email',
//                   obscureText: false,
//                   suffixIcon: null,
//                   preffixIcon: const Icon(Icons.email),
//                   // contentPadding: EdgeInsets.all(10),
//                 ),
//                 const SizedBox(height: 15),

//                 // password textfield
//                 MyTextField(
//                   controller: passwordController,
//                   hintText: 'Password',
//                   labelText: 'Password',
//                   obscureText: Visible,
//                   preffixIcon: const Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       Visible ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         Visible = !Visible;
//                       });
//                     },
//                   ),
//                   // contentPadding: EdgeInsets.all(10),
//                 ),

//                 const SizedBox(height: 15),

//                 // forgot password?
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       const Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
//                         child: TextButton(
//                           onPressed: forgotPassword,
//                           // Call the forgotPassword method
//                           child: const Text(
//                             'Forgot password? ',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 // sign in button
//                 // sign in button
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 30,
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: isLoading
//                           ? null
//                           : () {
//                               setState(() {
//                                 isLoading =
//                                     true; // Show circular progress indicator
//                               });
//                               var authProvider = LoginAuthProvider();
//                               authProvider
//                                   .loginPageValidation(
//                                 context: context,
//                                 emailController: emailController,
//                                 passwordController: passwordController,
//                               )
//                                   .whenComplete(() {
//                                 setState(() {
//                                   isLoading =
//                                       false; // Hide circular progress indicator
//                                 });
//                               });
//                             },
//                       style: ElevatedButton.styleFrom(
//                         textStyle: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold),
//                         padding: EdgeInsets.symmetric(
//                           vertical: 24,
//                           // horizontal: screenWidth >= 600 ? 430 : 90,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                               8), // Set border radius to 8
//                         ),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           if (!isLoading)
//                             // Only show text when not loading
//                             const Text("Login"),
//                           if (isLoading)
//                             // Show circular progress indicator when loading
//                             const CircularProgressIndicator(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 // // or continue with
//                 // const Padding(
//                 //   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                 //   child: Row(
//                 //     children: [
//                 //       Expanded(
//                 //         child: Divider(
//                 //           thickness: 0.5,
//                 //           color: Color.fromARGB(255, 204, 197, 197),
//                 //         ),
//                 //       ),
//                 //       Padding(
//                 //         padding: EdgeInsets.all(10),
//                 //         child: Text(
//                 //           'Or continue with',
//                 //           style: TextStyle(
//                 //             color: Color.fromARGB(255, 100, 95, 95),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //       Expanded(
//                 //         child: Divider(
//                 //           thickness: 0.5,
//                 //           color: Color.fromARGB(255, 204, 197, 197),
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),

//                 // const SizedBox(height: 15),

//                 // // google + apple sign in buttons
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     AuthMethods().signInWithGoogle(context);
//                 //   },
//                 //   child: Container(
//                 //     margin: EdgeInsets.symmetric(horizontal: 20.0),
//                 //     child: Material(
//                 //       elevation: 10.0,
//                 //       borderRadius: BorderRadius.circular(8),
//                 //       child: Container(
//                 //         padding: EdgeInsets.symmetric(
//                 //             vertical: 8.0, horizontal: 12.0),
//                 //         decoration: BoxDecoration(
//                 //             color: Color.fromARGB(255, 11, 57, 80),
//                 //             borderRadius: BorderRadius.circular(8)),
//                 //         child: Row(
//                 //           children: [
//                 //             Container(
//                 //                 height: 40,
//                 //                 width: 40,
//                 //                 child:
//                 //                     Image.asset("asset/images/google.png")),
//                 //             SizedBox(
//                 //               width: 30.0,
//                 //             ),
//                 //             Center(
//                 //               child: Text(
//                 //                 "Sign in with Google",
//                 //                 style: TextStyle(
//                 //                     color: Colors.white,
//                 //                     fontSize: 16.0,
//                 //                     fontWeight: FontWeight.bold),
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 // apple button
//                 //     SquareTile(
//                 //       onTap: () {},
//                 //       imagePath: 'asset/images/apple.png',
//                 //     ),
//                 //   ],
//                 // ),

//                 const SizedBox(height: 15),

//                 // not a member? register now
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not a member yet?\t \t',
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                     TextButton(
//                       onPressed: navigateToRegister,
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; // Import the dart:ui library for ImageFilter

import 'package:smart_home/auth/login_auth_provider.dart';
import 'package:smart_home/components/my_textfield.dart';
import 'package:smart_home/screen/signUp_screen.dart';

class Login extends StatefulWidget {
  final Function()? onTap;

  const Login({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool Visible = true;
  bool isLoading = false;

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Call the sign-in method with the email address
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);
      // Show error message
      showErrorMessage(e.code);
    }
  }

  // forgot password?
  void forgotPassword() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Send a password reset email to the user's email address
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      // Pop the loading circle
      Navigator.pop(context);

      // Show success message
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                'Dear, user we have sent password resetter link to your email,please check your email.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      // Show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Register(onTap: navigateToLogin),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(onTap: null),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://source.unsplash.com/random'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphic Container
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        // logo
                        // Image.asset('assets/images/imageedit_4_9823257150.png'),

                        const SizedBox(height: 15),
                        // welcome back, you've been missed!
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // email textfield
                        MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          labelText: 'Email',
                          obscureText: false,
                          suffixIcon: null,
                          preffixIcon: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 15),
                        // password textfield
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
                        // forgot password?
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: TextButton(
                                  onPressed: forgotPassword,
                                  // Call the forgotPassword method
                                  child: const Text(
                                    'Forgot password? ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        // sign in button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      setState(() {
                                        isLoading =
                                            true; // Show circular progress indicator
                                      });
                                      var authProvider = LoginAuthProvider();
                                      authProvider
                                          .loginPageValidation(
                                        context: context,
                                        emailController: emailController,
                                        passwordController: passwordController,
                                      )
                                          .whenComplete(() {
                                        setState(() {
                                          isLoading =
                                              false; // Hide circular progress indicator
                                        });
                                      });
                                    },
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                                padding: EdgeInsets.symmetric(vertical: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Set border radius to 8
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (!isLoading) const Text("Login"),
                                  if (isLoading)
                                    const CircularProgressIndicator(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member yet?\t \t',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            TextButton(
                              onPressed: navigateToRegister,
                              child: const Text(
                                'Register',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
