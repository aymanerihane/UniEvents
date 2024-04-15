
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unievents/JSON/userevent.dart';
import 'package:unievents/SQLite/database_helper.dart';
import 'package:unievents/wigets/MyButton.dart';

class SecondPage extends StatefulWidget {
  final int heroTag;
  const SecondPage({required this.heroTag});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? directoryPath;
  var event;
  var userEvent;
  

  Future<String> getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  

  @override
  void initState() {
    super.initState();
    event = Get.arguments;
    userEvent = Get.arguments;
    getDirectoryPath().then((path) {
      setState(() {
        directoryPath = path;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<DatabaseHelper>(context);

    // Check if currentUser is not null, else display 'Guest'
    final currentUser = auth.currentUser;
    final username = currentUser != null ? currentUser.usrName : 'Guest';
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
          top: 0,
          left: 0,
          right: 0,
            child: Image(
              image: FileImage(File('$directoryPath/${event.eventImage}')),
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,)),
            const SizedBox(height: 20.0),
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
              MyButton(label: "Participate", onTap: null, visibility: true),
              QrImageView(
              data: '${currentUser?.usrId}+${event.eventId}',
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
