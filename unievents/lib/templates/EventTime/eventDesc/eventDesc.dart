
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class SecondPage extends StatefulWidget {
  final int heroTag;
  const SecondPage({required this.heroTag});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? directoryPath;
  var event;

  Future<String> getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: FileImage(File('$directoryPath/${event.eventImage}')),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
            SizedBox(height: 20.0),
            Text(
              event.eventName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Date: ${event.eventDate}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10.0),
            
            SizedBox(height: 20.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              event.eventDescription,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              QrImageView(
              data: 'userid+${event.eventId}',
              version: QrVersions.auto,
              size: 200.0,
            )
            ],)
            
          ],
        ),
      ),
    );
  }
}
