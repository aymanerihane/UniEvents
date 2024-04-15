import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/templates/registration/auth.dart';
import 'package:provider/provider.dart';
import 'package:unievents/SQLite/database_helper.dart';




void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DatabaseHelper(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DatabaseHelper(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner:false,
        home: AuthScreen(),
      ),
    );
  }
}

