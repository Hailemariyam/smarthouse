import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoveControlScreen extends StatefulWidget {
  @override
  _StoveControlScreenState createState() => _StoveControlScreenState();
}

class _StoveControlScreenState extends State<StoveControlScreen> {
  bool isStoveOn = false;

  @override
  void initState() {
    super.initState();
    _fetchStoveStatus();
  }

  void _fetchStoveStatus() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('user_id')
        .collection('devices')
        .doc('stove')
        .get();
    setState(() {
      isStoveOn = snapshot['status'] == 'on';
    });
  }

  void _toggleStove() async {
    setState(() {
      isStoveOn = !isStoveOn;
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc('user_id')
        .collection('devices')
        .doc('stove')
        .set({'status': isStoveOn ? 'on' : 'off'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stove Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stove is ${isStoveOn ? "On" : "Off"}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Switch(
              value: isStoveOn,
              onChanged: (value) {
                _toggleStove();
              },
            ),
          ],
        ),
      ),
    );
  }
}
