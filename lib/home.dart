import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'start.dart';
import 'tour.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ]),
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
            // Image.asset(
            //   "assets/zanie.svg",
            //   height: 250,
            // ),
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
                      MaterialPageRoute(builder: (context) => Start()),
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
                      MaterialPageRoute(builder: (context) => Tour()),
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

myDrawer() {
  return Container(
    color: Colors.white,
    width: 250,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              "ZANIE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
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
          height: 100,
        ),
        ListTile(
          leading: Icon(Icons.account_circle_rounded),
          title: Text("Account"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("Games"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
        ListTile(
          leading: Icon(Icons.logout_outlined),
          title: Text("LogOut"),
        ),
        Container(
          child: ListTile(
            title: Text("Name",
                style: TextStyle(
                  color: Colors.white,
                )),
            subtitle: Text("email",
                style: TextStyle(
                  color: Colors.white,
                )),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
          height: 80,
        ),
      ],
    ),
  );
}
