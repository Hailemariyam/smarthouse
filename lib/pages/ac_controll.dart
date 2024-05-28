import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ACControlScreen extends StatefulWidget {
  @override
  _ACControlScreenState createState() => _ACControlScreenState();
}

class _ACControlScreenState extends State<ACControlScreen> {
  double currentTemperature = 24.0;
  double desiredTemperature = 24.0;

  @override
  void initState() {
    super.initState();
    _fetchACStatus();
  }

  void _fetchACStatus() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('user_id')
        .collection('devices')
        .doc('ac_controller')
        .get();
    setState(() {
      currentTemperature = snapshot['current_temperature'];
      desiredTemperature = snapshot['desired_temperature'];
    });
  }

  void _updateTemperature() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('user_id')
        .collection('devices')
        .doc('ac_controller')
        .set({
      'current_temperature': currentTemperature,
      'desired_temperature': desiredTemperature
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Temperature: ${currentTemperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Desired Temperature: ${desiredTemperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              value: desiredTemperature,
              min: 16.0,
              max: 30.0,
              divisions: 28,
              label: desiredTemperature.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  desiredTemperature = value;
                });
                _updateTemperature();
              },
            ),
          ],
        ),
      ),
    );
  }
}
