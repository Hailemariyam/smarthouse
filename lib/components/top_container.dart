// import 'dart:ui';

// import 'package:flutter/material.dart';

// class TopContainer extends StatelessWidget {
//   const TopContainer({
//     Key? key,
//     required this.child,
//     this.blur = 10,
//     this.opacity = 0.2,
//     this.color = Colors.black,
//     this.borderRadius,
//     required this.height, // Define the named parameter height
//     this.width, // Add this if width is variable
//   }) : super(key: key);

//   final Widget child;
//   final double blur;
//   final double opacity;
//   final Color color;
//   final BorderRadius? borderRadius;
//   final double height; // Define the named parameter height
//   final double? width; // Add this if width is variable

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height, // Set the height
//       width: width, // Set the width if provided
//       child: ClipRRect(
//         // borderRadius: borderRadius,
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
//           child: Container(
//             decoration: BoxDecoration(
//               color: color.withOpacity(opacity),
//               borderRadius: borderRadius,
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 child,
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(12),
//                         bottomRight: Radius.circular(12),
//                       ),
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.5),
//                           Colors.transparent,
//                         ],
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'SMART-HOME',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 5,
//                   child: Container(
//                     width: 1000,
//                     height: 90,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: Colors.white.withOpacity(0.2),
//                         width: 5,
//                       ),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         'assets/images/smarthome.jpg', // Path to your asset image
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
    required this.child,
    this.blur = 10,
    this.opacity = 0.2,
    this.color = Colors.black,
    this.borderRadius,
    required this.height, // Define the named parameter height
    this.width, // Add this if width is variable
  }) : super(key: key);

  final Widget child;
  final double blur;
  final double opacity;
  final Color color;
  final BorderRadius? borderRadius;
  final double height; // Define the named parameter height
  final double? width; // Add this if width is variable

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Set the height
      width: width, // Set the width if provided
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: borderRadius,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 25,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(60)),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(60)),
                      child: Image.asset(
                        'assets/images/smarthome.jpg', // Path to your asset image
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,

                    // Adjusted height for text container
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'SMART-HOME',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
