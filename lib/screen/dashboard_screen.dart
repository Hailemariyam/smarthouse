import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/pages/ac_controll.dart';
import 'package:smart_home/pages/light_bulb_controll.dart';
import 'package:smart_home/pages/stove_controlle.dart';

class DashboardScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Home Dashboard'),
      ),
      body: ListView(
        children: <Widget>[
          // ListTile(
          //   title: Text('Fire Alerts'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => FireAlertScreen()),
          //     );
          //   },
          // ),
          ListTile(
            title: Text('Light Control'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LightControlScreen()),
              );
            },
          ),
          ListTile(
            title: Text('AC Control'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ACControlScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Stove Control'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StoveControlScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
