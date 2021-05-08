import 'dart:async' show Future;
// import 'package:external_app_launcher/external_app_launcher.    dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text_plugins/speech_to_text_plugins.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  String _platformVersion = 'Unknown';

  SpeechToTextPlugins speechToTextPlugins = SpeechToTextPlugins();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
//      speechToTextPlugins.activate().then((onValue) {
//        print(onValue);
//      });
//    speechToTextPlugins.listen().then((onValue) {
//      print(onValue);
//    });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  String a = "";
  int b = 3;
  String c = "3";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
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
                    Container(
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Words you speak",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  "$a",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Text(
                            "wishes remaining:" + "$b",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      iconSize: 200,
                      icon: Image.network(
                        "https://www.clipartmax.com/png/middle/128-1280273_genie-lamp-clipart-character-aladdins-lamp.png",
                        height: 100,
                      ),
                      onPressed: () {
                        setState(() {
                          b = 3;
                        });
                        speechToTextPlugins.activate().then((onValue) {
                          print(onValue);
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        // MaterialButton(
                        //   child: Text('activate'),
                        //   onPressed: () {
                        //     setState(() {
                        //       b = 3;
                        //     });
                        //     speechToTextPlugins.activate().then((onValue) {
                        //       print(onValue);
                        //     });
                        //   },
                        // ),
                        IconButton(
                            color: Colors.white,
                            iconSize: 50,
                            icon: Icon(Icons.mic_none_rounded),
                            onPressed: () {
                              speechToTextPlugins.listen();
                            }),
                        IconButton(
                            color: Colors.white,
                            iconSize: 50,
                            icon: Icon(Icons.stop_circle_outlined),
                            onPressed: () {
                              speechToTextPlugins.stop().then((onValue) {
                                setState(() {
                                  a = onValue[0];
                                  b = b - 1;
                                });

                                print(onValue[0]);
                                tts(onValue[0]);
                              });
                            }),
                        // MaterialButton(
                        //   child: Text('stop'),
                        //   onPressed: () {
                        //     speechToTextPlugins.stop().then((onValue) {
                        //       setState(() {
                        //         a = onValue[0];
                        //         b = b - 1;
                        //       });

                        //       print(onValue[0]);
                        //       tts(onValue[0]);
                        //     });
                        //   },
                        // ),
                        // MaterialButton(
                        //   child: Text('cancel'),
                        //   onPressed: () {
                        //     speechToTextPlugins.cancel().then((onValue) {
                        //       print(onValue);
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}

tts(String message) async {
  print("function called");
  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("youtube")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.google.android.youtube',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("instagram")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.instagram.android',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("whatsapp")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.google.android.youtube',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("twitter")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.twitter.android',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("snapchat") &&
      message.toLowerCase().contains("open")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.snapchat.android',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("spotify") &&
      message.toLowerCase().contains("open")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.spotify.music',
      // openStore: false
    );
  }
  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("discord")) {
    await LaunchApp.openApp(
      androidPackageName: 'com.discord',
      // openStore: false
    );
  }
}
