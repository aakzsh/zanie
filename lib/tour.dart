import 'package:vimeoplayer/vimeoplayer.dart';
import 'package:flutter/material.dart';

class tour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 0xFFF2F2F2

      body: Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(0.0),
          child: VimeoPlayer(id: '560424997', autoPlay: true),
        )),
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
    );
  }
}
