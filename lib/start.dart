import 'dart:async' show Future;
// import 'package:external_app_launcher/external_app_launcher.    dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'tts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:genie/tts.dart';
import 'package:speech_to_text_plugins/speech_to_text_plugins.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

enum TtsState { playing, stopped, paused, continued }

class _StartState extends State<Start> {
  FlutterTts flutterTts = FlutterTts();

  String language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.3;
  bool isCurrentLanguageInstalled = false;

  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    if (isAndroid) {
      _getEngines();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<dynamic> _getLanguages() => flutterTts.getLanguages;

  Future _getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print(engine);
      }
    }
  }

  Future speak(String tt_speak) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setPitch(0.6);

    if (tt_speak != null) {
      if (tt_speak.isNotEmpty) {
        await flutterTts.awaitSpeakCompletion(true);
        await flutterTts.speak(tt_speak);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  List<DropdownMenuItem<String>> getLanguageDropDownMenuItems(
      dynamic languages) {
    var items = <DropdownMenuItem<String>>[];
    for (dynamic type in languages) {
      items.add(
          DropdownMenuItem(value: type as String, child: Text(type as String)));
    }
    return items;
  }

  void changedLanguageDropDownItem(String selectedType) {
    setState(() {
      language = selectedType;
      flutterTts.setLanguage(language);
      if (isAndroid) {
        flutterTts
            .isLanguageInstalled(language)
            .then((value) => isCurrentLanguageInstalled = (value as bool));
      }
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  String _platformVersion = 'Unknown';

  SpeechToTextPlugins speechToTextPlugins = SpeechToTextPlugins();

  @override
  Iterable<Contact> _contacts;
  List<String> phones = [];
  List<String> contactPhone = [];
  String info = "";

  Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  Future<String> findContact(name) async {
    await getContacts();
    _contacts.toSet().forEach((element) {
      if (element.displayName.toLowerCase() == name) {
        element.phones.toSet().forEach((phone) {
          contactPhone.add(phone.value);
        });
      }
    });
    return contactPhone[0] ?? "no one found";
  }

  Future<void> makeacall(name) async {
    info = await findContact(name);
    launch("tel: $info");
    info = "";
  }

  Future<void> sms(name) async {
    info = await findContact(name);
    launch("sms:$info");
    info = "";
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
  String img = "assets/blank.png";
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
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("$img", height: 200),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            img = "assets/evolve.gif";
                            b = 3;
                          });
                          Future.delayed(const Duration(milliseconds: 1300),
                              () {
                            setState(() {
                              img = "assets/logo.gif";
                            });
                          });
                          speechToTextPlugins.activate().then((onValue) {
                            print(onValue);
                          });
                        },
                        child: Image.asset(
                          "assets/lamp.png",
                          height: 100,
                        )),
                  ],
                ),
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
                  MaterialButton(
                    splashColor: Colors.purpleAccent,
                    onPressed: () {
                      speechToTextPlugins.listen();
                    },
                    child: Icon(
                      Icons.mic_none_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  MaterialButton(
                    splashColor: Colors.purpleAccent,
                    onPressed: () {
                      speechToTextPlugins.stop().then((onValue) {
                        setState(() {
                          a = onValue[0];
                          b = b - 1;
                        });

                        print(onValue[0]);
                        if (onValue[0]
                            .toString()
                            .toLowerCase()
                            .contains("call")) {
                          String name =
                              onValue[0].toString().toLowerCase().split(" ")[1];
                          print(name);
                          makeacall(name);
                        } else if (onValue[0]
                            .toString()
                            .toLowerCase()
                            .contains("text")) {
                          String name =
                              onValue[0].toString().toLowerCase().split(" ")[1];
                          print(name);
                          sms(name);
                        } else {
                          tts(onValue[0]);
                        }
                      });
                    },
                    child: Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.ac_unit),
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => TTS()));
                  //   },
                  // )

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
          ),
        )),
      ),
    );
  }
}

tts(String message) async {
  FlutterTts flutterTts = FlutterTts();
  print("function called");

  if (message.toLowerCase().contains("hey") ||
      message.toLowerCase().contains("hello") ||
      message.toLowerCase().contains("hi")) {
    await flutterTts.speak("Hello, how are you doing");
  }
  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("youtube")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.google.android.youtube',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("instagram")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.instagram.android',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("whatsapp")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.whatsapp',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("twitter")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.twitter.android',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("snapchat") &&
      message.toLowerCase().contains("open")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.snapchat.android',
      // openStore: false
    );
  }

  if (message.toLowerCase().contains("spotify") &&
      message.toLowerCase().contains("open")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.spotify.music',
      // openStore: false
    );
  }
  if (message.toLowerCase().contains("open") &&
      message.toLowerCase().contains("discord")) {
    await flutterTts.speak("sure, anything for you, anytime");
    await LaunchApp.openApp(
      androidPackageName: 'com.discord',
      // openStore: false
    );
  }
  if (message.toLowerCase().contains("joke") &&
      message.toLowerCase().contains("tell")) {
    await flutterTts.speak(
        " What’s the best thing about Switzerland? I don’t know, but the flag is a big plus haha.");
  }
  if (message.toLowerCase().contains("what") &&
      message.toLowerCase().contains("you do")) {
    await flutterTts.speak(
        "oh well I can open other applications like spotify, discord for you, tell you good jokes, and talk to you bestie");
  }
  if (message.toLowerCase().contains("i am") &&
      message.toLowerCase().contains("good")) {
    await flutterTts.speak("thats good to hear, you're the best anyways");
  }
  if (message.toLowerCase().contains("please") &&
      message.toLowerCase().contains("please")) {
    await flutterTts.speak("awe, dont say please, please");
  }
  if (message.toLowerCase().contains("name") &&
      message.toLowerCase().contains("your")) {
    await flutterTts
        .speak("my name is zaynie, they call me that and i kinda love it ");
  }
  // else {
  //   await flutterTts.speak("should i be knowing how to respond, haha");
  // }
}
