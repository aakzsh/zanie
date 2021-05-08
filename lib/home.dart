import 'package:flutter/material.dart';
import 'package:genie/start.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Welcome"),
            Text("to the greatest night"),
            Image.network("image aayrgi grnie ki"),
            Row(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Start()));
                  },
                  child: Text("Start"),
                  height: 40,
                  minWidth: 100,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text("Take a tour"),
                  height: 40,
                  minWidth: 100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
