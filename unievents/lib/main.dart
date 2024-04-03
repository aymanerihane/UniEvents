import 'package:flutter/material.dart';
import 'package:unievents/templates/drawer/hidden_drawer.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Signup Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Hidden_Drawer(),
    );
  }
}

