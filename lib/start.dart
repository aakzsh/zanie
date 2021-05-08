import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text_plugins/speech_to_text_plugins.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Text is: $a"),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MaterialButton(
                  child: Text('activate'),
                  onPressed: () {
                    speechToTextPlugins.activate().then((onValue) {
                      print(onValue);
                    });
                  },
                ),
                MaterialButton(
                  child: Text('listen'),
                  onPressed: () {
                    speechToTextPlugins.listen();
                  },
                ),
                MaterialButton(
                  child: Text('stop'),
                  onPressed: () {
                    speechToTextPlugins.stop().then((onValue) {
                      setState(() {
                        a = onValue[0];
                      });
                      print(onValue[0]);
                      tts(onValue[0]);
                    });
                  },
                ),
                MaterialButton(
                  child: Text('cancel'),
                  onPressed: () {
                    speechToTextPlugins.cancel().then((onValue) {
                      print(onValue);
                    });
                  },
                ),
              ],
            ),
          ],
        ))),
      ),
    );
  }
}

tts(String message) {
  print("function called");
}
