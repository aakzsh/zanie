import 'package:flutter/material.dart';
import 'package:genie/code.dart';
import 'qr.dart';

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
                      Text(
                        "GENIE",
                        style: TextStyle(color: Colors.pink, fontSize: 50),
                      )
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
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("OR"),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: MaterialButton(
                          elevation: 0.0,
                          child: Text(
                            "Enter code manually",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.pink),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Code()),
                            );
                          },
                          height: 50,
                          minWidth: 300,
                          color: Colors.black.withOpacity(0.0),
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          )),
        ),
      ),
    );
  }
}
