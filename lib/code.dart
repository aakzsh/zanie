import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("LogIn",
                      style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 30)),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "LogIn",
                focusColor: Colors.white,
              )),
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white, hintText: "SignUp"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
