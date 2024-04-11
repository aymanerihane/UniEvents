import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_app_file/open_app_file.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unievents/wigets/MyButton.dart';

class EventDescription extends StatefulWidget {
  const EventDescription({super.key});

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  String? directoryPath;

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          
          ListView(
            padding: const EdgeInsets.only(top: 200), // same as the height of the image
            children: const[
              Padding(
                padding: EdgeInsets.only(right: 8.0 , left: 8.0, top: 8.0, bottom: 160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                        SizedBox(height: 40,),
                        Center(child: MyButton(label: "Participate", onTap: null, visibility: true))
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
              image: FileImage(File('$directoryPath/IMG_20240304_155726.jpg')),
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

_appBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: const Text('Event Discription'),
    centerTitle: true,
  );
}
