import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'start.dart';
import 'tour.dart';
import 'Spotify.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "welcome",
                    style: GoogleFonts.unifrakturCook(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "TO THE GREATEST NIGHT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/logo.gif",
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  elevation: 0.0,
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Spotify()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    side: BorderSide(color: Colors.white, width: 2.5),
                  ),
                  height: 50,
                  minWidth: 100,
                  color: Colors.deepPurple,
                ),
                MaterialButton(
                  elevation: 0.0,
                  child: Text(
                    "Take a Tour",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tour()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    side: BorderSide(color: Colors.white, width: 2.5),
                  ),
                  height: 50,
                  minWidth: 100,
                  color: Colors.deepPurple,
                ),
              ],
            )
          ],
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
