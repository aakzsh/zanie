import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zanie/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
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
                      "LogIn",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (text) {
                        _email = text;
                      },
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (text2) {
                        _password = text2;
                      },
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
                                "LogIn",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _email, password: _password);
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
