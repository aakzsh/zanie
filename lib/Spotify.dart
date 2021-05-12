import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_mobile_sdk/spotify_mobile_sdk.dart';


class Spotify extends StatefulWidget {
  const Spotify({Key key}) : super(key: key);

  @override
  _SpotifyState createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {

  SpotifyMobileSdk _spotsdk = SpotifyMobileSdk();
  
  bool _connected = false;
  bool _init = false;

  bool _crossfadeEnabled;
  int _crossfadeDuration;

  @override
  void initState() {

    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool connected;
    bool init;

    try {
      init = await _spotsdk.init(clientId: "6c1ada0e576c4579b4d4b528a2b05da8", redirectUri: "spotify-sdk://auth");
    } on PlatformException {
      print("Platfrom exception init");
    }

    try {
      connected = await _spotsdk.isConnected;
    } on PlatformException {
      print("Platform exception unable to connect");
    }

    if (!mounted) return;

    setState(() {
      _init = init;
      _connected = connected;
    });
  }
  
  Future<void> getCrossFadeStateNow() async {
    SpotifyCrossfadeState crossfadeState;
    bool crossfadeEnabled;
    int crossfadeDuration;
    
    try {
      crossfadeState = await _spotsdk.crossfadeState;
      crossfadeEnabled = crossfadeState.isEnabled;
      crossfadeDuration = crossfadeState.duration;
    } on PlatformException {
      print("Platform exception getCrossFadeStateNow");
    }
    
    setState(() {
      _crossfadeEnabled = crossfadeEnabled;
      _crossfadeDuration = crossfadeDuration;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify sdk'),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
              
              child: Text("Play Lyriske 9mm"),
              onPressed: () async {
                try {
                  await _spotsdk.play(spotifyUri:  "spotify:track:5jgxQsZq6njAFQm4V2EUzZ");
                } catch (e) {
                  print("exception caught while playing song $e");
                }
              },
                
          
          )
        ],
      ),
    );
  }
}
