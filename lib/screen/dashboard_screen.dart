import 'package:flutter/material.dart';
import 'package:smart_home/components/mymenu.dart';
import 'package:smart_home/pages/ac_controll.dart';
import 'package:smart_home/pages/light_bulb_controll.dart';
import 'package:smart_home/pages/stove_controlle.dart';
import 'package:smart_home/components/top_container.dart'; // Importing the TopContainer component

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
      body: Column(
        children: [
          // Adding the TopContainer at the top
          const TopContainer(
            child:
                Text(''), // Change this to whatever content you want at the top
            blur: 10,
            opacity: 0.2,
            color: Color.fromARGB(107, 73, 127, 210),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
            // Set width to double.infinity and specify a height
            // Here, I'm setting the height to 200, you can adjust as needed
            // Change the height according to your requirement
            height: 200,
            width: double.infinity,
          ),

          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(107, 73, 127, 210),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60))),
              height: MediaQuery.of(context).size.height / 1.75,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                builder: (context) => menuItem['route']),
                          );
                        },
                      );
                    },
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
