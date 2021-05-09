import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class tour extends StatefulWidget {

  @override
  _tourState createState() => _tourState();
}

class _tourState extends State<tour>{

  VideoPlayerController _controller;

  @override
  void initState() {

    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/zanie.mp4')
    ..initialize();

  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(


      body: Container(

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
        child: _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
        )
            : Container()

      ),

     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.purpleAccent,
       onPressed: () {
         setState(() {
           _controller.value.isPlaying
               ? _controller.pause()
               : _controller.play();
         });
       },
       child: Icon (

         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
       ),
     ),




   );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }




}
