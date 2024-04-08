import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unievents/wigets/input.dart';

class Add_event extends StatelessWidget {
  const Add_event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyInput(
            hint: 'Enter Event Title',
            title: 'Event Title',
          ),
          MyInput(
            hint: 'Enter Event Title',
            title: 'Event Title',
          ),
        ],
      ),
    );
  }
}

_appBar(){
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ), 
    title: const Text('Add Event'),
    centerTitle: true,
  );
}

