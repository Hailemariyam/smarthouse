import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LightControlScreen extends StatefulWidget {
  @override
  _LightControlScreenState createState() => _LightControlScreenState();
}

class _LightControlScreenState extends State<LightControlScreen> {
  bool isLightOn = false;

  @override
  void initState() {
    super.initState();
    _fetchLightStatus();
  }

  void _fetchLightStatus() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('user_id')
        .collection('devices')
        .doc('light_bulb')
        .get();
    setState(() {
      isLightOn = snapshot['status'] == 'on';
    });
  }

  void _toggleLight() async {
    setState(() {
      isLightOn = !isLightOn;
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc('user_id')
        .collection('devices')
        .doc('light_bulb')
        .set({'status': isLightOn ? 'on' : 'off'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Light is ${isLightOn ? "On" : "Off"}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Switch(
              value: isLightOn,
              onChanged: (value) {
                _toggleLight();
              },
            ),
          ],
        ),
      ),
    );
  }
}
