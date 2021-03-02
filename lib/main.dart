import 'package:flutter/material.dart';
import 'package:cc_prototype/screens/Home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme:
        ThemeData(accentColor: Colors.amberAccent, primaryColor: Colors.amber),
  ));
}
