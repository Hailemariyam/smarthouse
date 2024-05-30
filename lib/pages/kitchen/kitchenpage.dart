import 'package:flutter/material.dart';
import 'package:smart_home/components/mymenu.dart';
import 'dart:ui'; // Import the dart:ui library for ImageFilter

class KitchenControl extends StatefulWidget {
  @override
  _KitchenControlState createState() => _KitchenControlState();
}

class _KitchenControlState extends State<KitchenControl> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Refrigerator Control',
      'icon': Icons.kitchen,
      'warna': Colors.blue,
      'control': 'fridge',
    },
    {
      'title': 'Microwave Control',
      'icon': Icons.microwave,
      'warna': Colors.orange,
      'control': 'microwave',
    },
    {
      'title': 'Oven Control',
      'icon': Icons.restaurant,
      'warna': Colors.red,
      'control': 'oven',
    },
    {
      'title': 'Dishwasher Control',
      'icon': Icons.local_laundry_service,
      'warna': Colors.cyan,
      'control': 'dishwasher',
    },
    {
      'title': 'Coffee Maker Control',
      'icon': Icons.coffee,
      'warna': Colors.brown,
      'control': 'coffee_maker',
    },
    {
      'title': 'Toaster Control',
      'icon': Icons.breakfast_dining,
      'warna': Colors.amber,
      'control': 'toaster',
    },
  ];

  bool _showFridgeControl = false;
  bool _showMicrowaveControl = false;
  bool _showOvenControl = false;
  bool _showDishwasherControl = false;
  bool _showCoffeeMakerControl = false;
  bool _showToasterControl = false;

  bool _isFridgeOn = false;
  bool _isMicrowaveOn = false;
  bool _isOvenOn = false;
  bool _isDishwasherOn = false;
  bool _isCoffeeMakerOn = false;
  bool _isToasterOn = false;

  void _toggleControl(String control) {
    setState(() {
      if (control == 'fridge') {
        _showFridgeControl = !_showFridgeControl;
        _showMicrowaveControl = false;
        _showOvenControl = false;
        _showDishwasherControl = false;
        _showCoffeeMakerControl = false;
        _showToasterControl = false;
      } else if (control == 'microwave') {
        _showMicrowaveControl = !_showMicrowaveControl;
        _showFridgeControl = false;
        _showOvenControl = false;
        _showDishwasherControl = false;
        _showCoffeeMakerControl = false;
        _showToasterControl = false;
      } else if (control == 'oven') {
        _showOvenControl = !_showOvenControl;
        _showFridgeControl = false;
        _showMicrowaveControl = false;
        _showDishwasherControl = false;
        _showCoffeeMakerControl = false;
        _showToasterControl = false;
      } else if (control == 'dishwasher') {
        _showDishwasherControl = !_showDishwasherControl;
        _showFridgeControl = false;
        _showMicrowaveControl = false;
        _showOvenControl = false;
        _showCoffeeMakerControl = false;
        _showToasterControl = false;
      } else if (control == 'coffee_maker') {
        _showCoffeeMakerControl = !_showCoffeeMakerControl;
        _showFridgeControl = false;
        _showMicrowaveControl = false;
        _showOvenControl = false;
        _showDishwasherControl = false;
        _showToasterControl = false;
      } else if (control == 'toaster') {
        _showToasterControl = !_showToasterControl;
        _showFridgeControl = false;
        _showMicrowaveControl = false;
        _showOvenControl = false;
        _showDishwasherControl = false;
        _showCoffeeMakerControl = false;
      }
    });
  }

  void _toggleFridge() {
    setState(() {
      _isFridgeOn = !_isFridgeOn;
    });
  }

  void _toggleMicrowave() {
    setState(() {
      _isMicrowaveOn = !_isMicrowaveOn;
    });
  }

  void _toggleOven() {
    setState(() {
      _isOvenOn = !_isOvenOn;
    });
  }

  void _toggleDishwasher() {
    setState(() {
      _isDishwasherOn = !_isDishwasherOn;
    });
  }

  void _toggleCoffeeMaker() {
    setState(() {
      _isCoffeeMakerOn = !_isCoffeeMakerOn;
    });
  }

  void _toggleToaster() {
    setState(() {
      _isToasterOn = !_isToasterOn;
    });
  }

  void _cancelControl() {
    setState(() {
      _showFridgeControl = false;
      _showMicrowaveControl = false;
      _showOvenControl = false;
      _showDishwasherControl = false;
      _showCoffeeMakerControl = false;
      _showToasterControl = false;
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
          if (_showFridgeControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Refrigerator Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleFridge,
                      child: Text(
                          _isFridgeOn ? 'Turn Off Fridge' : 'Turn On Fridge'),
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
          if (_showMicrowaveControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Microwave Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleMicrowave,
                      child: Text(_isMicrowaveOn
                          ? 'Turn Off Microwave'
                          : 'Turn On Microwave'),
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
          if (_showOvenControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Oven Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleOven,
                      child: Text(_isOvenOn ? 'Turn Off Oven' : 'Turn On Oven'),
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
          if (_showDishwasherControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Dishwasher Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleDishwasher,
                      child: Text(_isDishwasherOn
                          ? 'Turn Off Dishwasher'
                          : 'Turn On Dishwasher'),
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
          if (_showCoffeeMakerControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Coffee Maker Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleCoffeeMaker,
                      child: Text(_isCoffeeMakerOn
                          ? 'Turn Off Coffee Maker'
                          : 'Turn On Coffee Maker'),
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
          if (_showToasterControl)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Toaster Control',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleToaster,
                      child: Text(_isToasterOn
                          ? 'Turn Off Toaster'
                          : 'Turn On Toaster'),
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
