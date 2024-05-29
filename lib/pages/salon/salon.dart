// import 'package:flutter/material.dart';
// import 'package:smart_home/components/mymenu.dart';
// import 'package:smart_home/pages/ac_controll.dart';
// import 'package:smart_home/pages/light_bulb_controll.dart';
// import 'package:smart_home/pages/stove_controlle.dart';
// // Importing the TopContainer component

// class SalonControll extends StatelessWidget {
//   final List<Map<String, dynamic>> menuItems = [
//     {
//       'title': 'Light Control',
//       'icon': Icons.lightbulb,
//       'warna': Colors.yellow,
//       'route': LightControlScreen(),
//     },
//     {
//       'title': 'AC Control',
//       'icon': Icons.ac_unit,
//       'warna': Colors.blue,
//       'route': ACControlScreen(),
//     },
//     {
//       'title': 'Stove Control',
//       'icon': Icons.kitchen,
//       'warna': Colors.red,
//       'route': StoveControlScreen(),
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Adding the TopContainer at the top

//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(155, 2, 17, 23),
//                 borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount:
//                         MediaQuery.of(context).size.width > 600 ? 3 : 2,
//                     crossAxisSpacing: 10.0,
//                     mainAxisSpacing: 10.0,
//                   ),
//                   itemCount: menuItems.length,
//                   itemBuilder: (context, index) {
//                     final menuItem = menuItems[index];
//                     return MyMenu(
//                       title: menuItem['title'],
//                       icon: menuItem['icon'],
//                       warna: menuItem['warna'],
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => menuItem['route']),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smart_home/components/mymenu.dart';
import 'package:smart_home/pages/ac_controll.dart';
import 'package:smart_home/pages/light_bulb_controll.dart';
import 'package:smart_home/pages/stove_controlle.dart';
import 'dart:ui'; // Import the dart:ui library for ImageFilter

class SalonControll extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Light Control',
      'icon': Icons.lightbulb,
      'warna': Colors.yellow,
      'route': LightControlScreen(),
    },
    {
      'title': 'AC Control',
      'icon': Icons.ac_unit,
      'warna': Colors.blue,
      'route': ACControlScreen(),
    },
    {
      'title': 'Stove Control',
      'icon': Icons.kitchen,
      'warna': Colors.red,
      'route': StoveControlScreen(),
    },
  ];

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
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).size.width > 600 ? 3 : 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: menuItems.length,
                          itemBuilder: (context, index) {
                            final menuItem = menuItems[index];
                            return MyMenu(
                              title: menuItem['title'],
                              icon: menuItem['icon'],
                              warna: menuItem['warna'],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => menuItem['route'],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
