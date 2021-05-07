/*
this is the starting point
main fnc runs the app, the app will render welcome screen,
then the user can scan code or enter code, redicrecting to qr.dart and code.dart respectively
after succesfully scanning/entering the code, user will be redirected to home.dart
about home.dart, it'll have everything, not exactly sure what tho as for now
*/

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset("//logo here"),
            MaterialButton(
              onPressed: () {},
              child: Text("Scan QR Code"),
            ),
            Text("or"),
            MaterialButton(
              onPressed: () {},
              child: Text("Enter code manually"),
            ),
          ],
        ),
      ),
    );
  }
}
