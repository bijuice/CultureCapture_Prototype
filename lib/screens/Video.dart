import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  final String name, avatar, likes, url, title;

  Video({this.name, this.likes, this.url, this.title, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(child: Text(title)),
      ),
    );
  }
}
