import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_app_file/open_app_file.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:unievents/wigets/MyButton.dart';

class EventDescription extends StatefulWidget {
  const EventDescription({super.key,});

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  String? directoryPath;
  var event;

  @override
  void initState() {
    super.initState();
    event = Get.arguments;
    getDirectoryPath().then((path) {
      setState(() {
        directoryPath = path;
      });
    });
  }

  Future<String> getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
Widget build(BuildContext context) {
  if (directoryPath != null) {
    print(event.eventImage);
    return Scaffold(
      appBar: _appBar(event.eventName),
      body: Stack(
        children: [
          
          ListView(
            padding: const EdgeInsets.only(top: 200), // same as the height of the image
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0 , left: 8.0, top: 8.0, bottom: 160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.eventName,
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(
                        event.eventDescription,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                        SizedBox(height: 40,),
                        // Center(child: MyButton(label: "Participate", onTap: null, visibility: true))
                  ],
                ),
              ),
            ],
          ),
          Positioned(
          top: 0,
          left: 0,
          right: 0,
            child: Image(
              image: FileImage(File('$directoryPath/${event.eventImage}')),
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
    ),
        ],
      ),
    );
  } else {
    return Container(); // Show loading indicator while waiting for the path
  }

  }
}


_appBar(String eventName) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: Text(eventName),
    centerTitle: true,
  );
}