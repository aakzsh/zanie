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
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enter the magic code",
              style : TextStyle(color: Colors.white, fontSize: 24)),
              SizedBox(
                width: 20.0,
                  height: 20.0,
              ),
              TextField(
                onChanged: (text) {
                  txt_val = text;
                },




                decoration: InputDecoration(
                  hintText: "code",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(
                      
                    ),
                  ),

                ),
                ),

              SizedBox(
                width: 20.0,
                height: 20.0,
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
                color: Colors.purpleAccent,
                child: Text("Let the magic begin",
                style: TextStyle(color: Colors.white)),
              ),
              Text("$msg"),
            ],
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black87,
                Colors.deepPurple
                // Color(0x262427),
                // Color(0x4815DA)
              ],
            )),
      ),
    );
  }
}
