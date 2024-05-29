import 'package:flutter/material.dart';
import 'package:smart_home/pages/ac_controll.dart';
import 'package:smart_home/pages/garden/garden_page.dart';
import 'package:smart_home/pages/kitchen/kitchenpage.dart';
import 'package:smart_home/pages/light_bulb_controll.dart';
import 'package:smart_home/pages/salon/salon.dart';
import 'package:smart_home/pages/stove_controlle.dart';
import 'package:smart_home/screen/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    SalonControll(),
    KitchenControll(),
    GardenControll(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sports_gymnastics,
              color: Colors.black,
            ),
            label: 'Salon',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.kitchen,
              color: Colors.black,
            ),
            label: 'Kitchen',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grass,
              color: Colors.black,
            ),
            label: 'Garden',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black, // Set unselected icon color
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
