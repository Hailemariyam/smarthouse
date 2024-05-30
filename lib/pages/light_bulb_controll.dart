import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class LightControlScreen extends StatefulWidget {
  @override
  _LightControlScreenState createState() => _LightControlScreenState();
}

class _LightControlScreenState extends State<LightControlScreen> {
  bool isLightOn = false;
  String offUrl = "http://192.168.0.3/26/off";
  String onUrl = "http://192.168.0.3/26/on";

  @override
  void initState() {
    super.initState();
    // _fetchLightStatus();
  }

  // void _fetchLightStatus() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('user_id')
  //       .collection('devices')
  //       .doc('light_bulb')
  //       .get();
  //   setState(() {
  //     isLightOn = snapshot['status'] == 'on';
  //   });
  // }

  // void _toggleLight() async {
  //   setState(() {
  //     isLightOn = !isLightOn;
  //   });
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('user_id')
  //       .collection('devices')
  //       .doc('light_bulb')
  //       .set({'status': isLightOn ? 'on' : 'off'});
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Light is ${isLightOn ? "On" : "Off"}',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Switch(
//               value: isLightOn,
//               onChanged: (value) {
//                 _toggleLight();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
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

  void _toggleLight() async {
    setState(() {
      isLightOn = !isLightOn;
      callRest(isLightOn);
    });
  }

  void callRest(isLightOn) {
    if (isLightOn) {
      http.get(Uri.parse(onUrl));
    }
    if (!isLightOn) {
      http.get(Uri.parse(offUrl));
    }
  }
}
