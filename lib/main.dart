import 'package:flutter/material.dart';
import 'code.dart';

import 'qr.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.deepPurpleAccent,
      title: "Zanie",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.gif",
                        height: 150,
                      ),
                      Text("ZANIE",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 50))
                    ],
                  ),
                ),
                Container(
                  height: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: MaterialButton(
                            elevation: 0.0,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRViewExample()),
                              );
                            },
                            height: 50,
                            minWidth: 300,
                            // color: Colors.purpleAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: MaterialButton(
                              elevation: 0.0,
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.purpleAccent),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Code()),
                                );
                              },
                              height: 50,
                              minWidth: 300,
                              color: Colors.transparent),
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.white),
                      ),
                      MaterialButton(
                        child: Text(
                          "Continue as a guest",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
