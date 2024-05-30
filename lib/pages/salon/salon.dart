import 'package:flutter/material.dart';
import 'package:smart_home/components/mymenu.dart';
import 'dart:ui'; // Import the dart:ui library for ImageFilter

class SalonControll extends StatefulWidget {
  @override
  _SalonControllState createState() => _SalonControllState();
}

class _SalonControllState extends State<SalonControll> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Light Control',
      'icon': Icons.lightbulb,
      'warna': Colors.yellow,
      'control': 'light',
    },
    {
      'title': 'AC Control',
      'icon': Icons.ac_unit,
      'warna': Colors.blue,
      'control': 'ac',
    },
    {
      'title': 'Stove Control',
      'icon': Icons.kitchen,
      'warna': Colors.red,
      'control': 'stove',
    },
  ];

  bool _showLightControl = false;
  bool _showACControl = false;
  bool _showStoveControl = false;
  bool _isLightOn = false;
  bool _isACOn = false;
  bool _isStoveOn = false;

  void _toggleControl(String control) {
    setState(() {
      if (control == 'light') {
        _showLightControl = !_showLightControl;
        _showACControl = false;
        _showStoveControl = false;
      } else if (control == 'ac') {
        _showACControl = !_showACControl;
        _showLightControl = false;
        _showStoveControl = false;
      } else if (control == 'stove') {
        _showStoveControl = !_showStoveControl;
        _showLightControl = false;
        _showACControl = false;
      }
    });
  }

  void _toggleLight() {
    setState(() {
      _isLightOn = !_isLightOn;
    });
  }

  void _toggleAC() {
    setState(() {
      _isACOn = !_isACOn;
    });
  }

  void _toggleStove() {
    setState(() {
      _isStoveOn = !_isStoveOn;
    });
  }

  void _cancelControl() {
    setState(() {
      _showLightControl = false;
      _showACControl = false;
      _showStoveControl = false;
    });
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
                                _toggleControl(menuItem['control']);
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
          if (_showLightControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Light Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleLight,
                      child:
                          Text(_isLightOn ? 'Turn Off Light' : 'Turn On Light'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _cancelControl,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          if (_showACControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'AC Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleAC,
                      child: Text(_isACOn ? 'Turn Off AC' : 'Turn On AC'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _cancelControl,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          if (_showStoveControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Stove Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleStove,
                      child:
                          Text(_isStoveOn ? 'Turn Off Stove' : 'Turn On Stove'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _cancelControl,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
