// import 'package:flutter/material.dart';
// import 'package:smart_home/components/mymenu.dart';
// import 'package:smart_home/pages/ac_controll.dart';
// import 'package:smart_home/pages/light_bulb_controll.dart';
// import 'package:smart_home/pages/stove_controlle.dart';
// import 'package:smart_home/components/top_container.dart'; // Importing the TopContainer component

// class DashboardScreen extends StatelessWidget {
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
//       body: Container(
//         // color: Color.fromARGB(255, 111, 170, 238),
//         child: Column(
//           children: [
//             // Adding the TopContainer at the top
//             Container(
//               width: double.infinity,
//               height: 200,
//               color: Color.fromARGB(107, 111, 52, 248),
//               child: TopContainer(
//                 child: Text(
//                     ''), // Change this to whatever content you want at the top
//                 blur: 10,
//                 opacity: 0.2,
//                 color: Color.fromARGB(107, 73, 127, 210),
//                 borderRadius:
//                     BorderRadius.only(bottomLeft: Radius.circular(60)),
//                 // Set width to double.infinity and specify a height
//                 // Here, I'm setting the height to 200, you can adjust as needed
//                 // Change the height according to your requirement
//                 height: 200,
//                 width: double.infinity,
//               ),
//             ),

//             Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height / 1.75,
//               color: Color.fromARGB(107, 73, 127, 210),
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     borderRadius:
//                         BorderRadius.only(topRight: Radius.circular(60))),
//                 height: MediaQuery.of(context).size.height / 1.75,
//                 child: Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount:
//                             MediaQuery.of(context).size.width > 600 ? 3 : 2,
//                         crossAxisSpacing: 10.0,
//                         mainAxisSpacing: 10.0,
//                       ),
//                       itemCount: menuItems.length,
//                       itemBuilder: (context, index) {
//                         final menuItem = menuItems[index];
//                         return MyMenu(
//                           title: menuItem['title'],
//                           icon: menuItem['icon'],
//                           warna: menuItem['warna'],
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => menuItem['route']),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui'; // Import the dart:ui library for ImageFilter
import 'package:smart_home/components/mymenu.dart';
import 'package:smart_home/pages/ac_controll.dart';
import 'package:smart_home/pages/light_bulb_controll.dart';
import 'package:smart_home/pages/stove_controlle.dart';
import 'package:smart_home/components/top_container.dart';

class DashboardScreen extends StatelessWidget {
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
                // image: NetworkImage('https://source.unsplash.com/random'),
                image: AssetImage('assets/images/containerbg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphic TopContainer
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: TopContainer(
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        blur: 10,
                        opacity: 0.2,
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(60)),
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              // Glassmorphic Bottom Container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.75,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
