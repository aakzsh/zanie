import 'package:flutter/material.dart';
import 'package:genie/code.dart';
import 'qr.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      Image.network(
                        "https://media1.giphy.com/media/JQ3KNPhuO0GDJEke3J/giphy.gif?cid=6c09b952yy1728uxs2hxokrov2p9ti2wkqlqr7qfrd5akopi&rid=giphy.gif",
                        height: 150,
                      ),
                      Text("GENIE",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 50))
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: MaterialButton(
                          elevation: 0.0,
                          child: Text(
                            "Scan QR-Code",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
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
                          color: Colors.purpleAccent,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          child: MaterialButton(
                            elevation: 0.0,
                            child: Text(
                              "Enter code manually",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.purpleAccent),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Code()),
                              );
                            },
                            height: 50,
                            minWidth: 300,
                            color: Colors.white,
                          ),
                        ),
                      )
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
