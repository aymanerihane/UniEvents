
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import 'package:unievents/DB%20&%20Controllers/database_helper.dart';
import 'package:unievents/DB%20&%20Controllers/userController.dart';
import 'package:unievents/wigets/MyButton.dart';

class SecondPage extends StatefulWidget {
  final int heroTag;
  const SecondPage({required this.heroTag});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var event;
  var userEvent;
  var db = DatabaseHelper();
  var isParticipating;
  late final currentUser;
  

  

  @override
  void initState() {
    super.initState();
    event = Get.arguments;
    userEvent = Get.arguments;
    checkParticipation();
  }
  Future<void> checkParticipation() async {
    currentUser = UserController().currentUser;
    bool participationStatus = await db.checkIFParticipe(currentUser.usrId!, event.eventId!) == 1;
    setState(() {
      isParticipating = participationStatus;
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
            Positioned(
          top: 0,
          left: 0,
          right: 0,
            child: Image(
              image: FileImage(File('${event.eventImage}')),
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
              MyButton(label: "Participate", onTap:()=> {
                db.insertUserEvent(currentUser.usrId!,event.eventId),
                Get.back(),
                //snakbar
                Get.snackbar('Success','You have successfully participated in the event!',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green[300]),
                            

                }, visibility: !isParticipating),
              Visibility(
                visible: isParticipating,
                child: QrImageView(
                data: 'Participant: ${currentUser.usrName} || event: ${event.eventName}',
                version: QrVersions.auto,
                size: 200.0,
                            ),
              )
            ],)
            
          ],
        ),
      ),
    );
    
  }
}
