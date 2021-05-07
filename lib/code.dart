import 'package:flutter/material.dart';
import 'package:genie/home.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

String txt_val, msg = "";

class _CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Enter the magic code"),
            TextField(
              onChanged: (text) {
                txt_val = text;
              },
              decoration: InputDecoration(
                hintText: "code",
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (txt_val == "genie") {
                  print("success");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  setState(() {
                    msg = "uh oh, wrong passkey, try again";
                  });
                  print("fail");
                }
              },
              color: Colors.pink,
              child: Text("let the magic begin"),
            ),
            Text("$msg"),
          ],
        ),
      ),
    );
  }
}
