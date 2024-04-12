import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/templates/registration/auth.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner:false,
        home:  AuthScreen(),
    );
  }
}

