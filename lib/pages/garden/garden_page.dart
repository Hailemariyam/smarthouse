import 'package:flutter/material.dart';
import 'package:smart_home/components/mymenu.dart';
import 'dart:ui'; // Import the dart:ui library for ImageFilter

class GardenControl extends StatefulWidget {
  @override
  _GardenControlState createState() => _GardenControlState();
}

class _GardenControlState extends State<GardenControl> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Garden Lights',
      'icon': Icons.wb_sunny,
      'warna': Colors.yellow,
      'control': 'garden_lights',
    },
    {
      'title': 'Sprinklers',
      'icon': Icons.opacity,
      'warna': Colors.blue,
      'control': 'sprinklers',
    },
    {
      'title': 'Fountain',
      'icon': Icons.pool,
      'warna': Colors.green,
      'control': 'fountain',
    },
  ];

  bool _showGardenLightsControl = false;
  bool _showSprinklersControl = false;
  bool _showFountainControl = false;
  bool _isGardenLightsOn = false;
  bool _isSprinklersOn = false;
  bool _isFountainOn = false;

  void _toggleControl(String control) {
    setState(() {
      if (control == 'garden_lights') {
        _showGardenLightsControl = !_showGardenLightsControl;
        _showSprinklersControl = false;
        _showFountainControl = false;
      } else if (control == 'sprinklers') {
        _showSprinklersControl = !_showSprinklersControl;
        _showGardenLightsControl = false;
        _showFountainControl = false;
      } else if (control == 'fountain') {
        _showFountainControl = !_showFountainControl;
        _showGardenLightsControl = false;
        _showSprinklersControl = false;
      }
    });
  }

  void _toggleGardenLights() {
    setState(() {
      _isGardenLightsOn = !_isGardenLightsOn;
    });
  }

  void _toggleSprinklers() {
    setState(() {
      _isSprinklersOn = !_isSprinklersOn;
    });
  }

  void _toggleFountain() {
    setState(() {
      _isFountainOn = !_isFountainOn;
    });
  }

  void _cancelControl() {
    setState(() {
      _showGardenLightsControl = false;
      _showSprinklersControl = false;
      _showFountainControl = false;
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
                image:
                    NetworkImage('https://source.unsplash.com/random?nature'),
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
          if (_showGardenLightsControl)
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
                      'Garden Lights Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleGardenLights,
                      child: Text(_isGardenLightsOn
                          ? 'Turn Off Garden Lights'
                          : 'Turn On Garden Lights'),
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
          if (_showSprinklersControl)
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
                      'Sprinklers Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleSprinklers,
                      child: Text(_isSprinklersOn
                          ? 'Turn Off Sprinklers'
                          : 'Turn On Sprinklers'),
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
          if (_showFountainControl)
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
                      'Fountain Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleFountain,
                      child: Text(_isFountainOn
                          ? 'Turn Off Fountain'
                          : 'Turn On Fountain'),
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
