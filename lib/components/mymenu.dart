// import 'package:flutter/material.dart';
// import 'dart:ui';

// class MyMenu extends StatefulWidget {
//   MyMenu({
//     required this.title,
//     required this.icon,
//     required this.warna,
//     this.onTap,
//   });

//   final Function()? onTap;
//   final String title;
//   final IconData icon;
//   final MaterialColor warna;

//   @override
//   _MyMenuState createState() => _MyMenuState();
// }

// class _MyMenuState extends State<MyMenu> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Adjust the icon size and text style based on screen width
//     final iconSize = screenWidth > 600 ? 80.0 : 30.0;
//     final textStyle = TextStyle(
//       fontSize: screenWidth > 600 ? 16.0 : 10.0,
//       fontWeight: FontWeight.bold,
//       color: Color.fromARGB(255, 11, 11, 11),
//     );

//     return Container(
//       margin: const EdgeInsets.all(10.0),
//       child: GestureDetector(
//         onTap: widget.onTap,
//         child: MouseRegion(
//           onEnter: (event) {
//             setState(() {
//               isHovered = true;
//             });
//           },
//           onExit: (event) {
//             setState(() {
//               isHovered = false;
//             });
//           },
//           child: Material(
//             elevation: isHovered ? 10 : 4,
//             shadowColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 12, 12, 12).withOpacity(0.06),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(
//                       color: Colors.white.withOpacity(0.3),
//                       width: 1.0,
//                     ),
//                   ),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Icon(
//                           widget.icon,
//                           size: iconSize,
//                           color: const Color.fromARGB(255, 15, 3, 129),
//                         ),
//                         Text(
//                           widget.title,
//                           style: textStyle,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui';

class MyMenu extends StatefulWidget {
  MyMenu({
    required this.title,
    required this.icon,
    required this.warna,
    this.onTap,
    this.data,
  });

  final Function()? onTap;
  final String title;
  final IconData icon;
  final MaterialColor warna;
  final String? data;

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust the icon size and text style based on screen width
    final iconSize = screenWidth > 600 ? 80.0 : 30.0;
    final textStyle = TextStyle(
      fontSize: screenWidth > 600 ? 16.0 : 10.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 11, 11, 11),
    );

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovered = false;
            });
          },
          child: Material(
            elevation: isHovered ? 10 : 4,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 12, 12, 12).withOpacity(0.06),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          widget.icon,
                          size: iconSize,
                          color: const Color.fromARGB(255, 15, 3, 129),
                        ),
                        Text(
                          widget.title,
                          style: textStyle,
                        ),
                        if (widget.data != null) ...[
                          SizedBox(height: 10),
                          Text(
                            widget.data!,
                            style: textStyle,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
