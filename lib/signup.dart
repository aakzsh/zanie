import 'package:flutter/material.dart';
import 'package:zanie/home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 30),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios_outlined,
                            color: Colors.white),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Name",
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2.0, color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent),
                            child: MaterialButton(
                              child: Text(
                                "Create Account",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              },
                            ),
                          )
                        ],
                      ))
                ],
              ))),
    );
  }
}
