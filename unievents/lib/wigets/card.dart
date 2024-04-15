import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/DB%20&%20Controllers/database_helper.dart';
import 'package:unievents/DB%20&%20Controllers/userController.dart';
import 'package:unievents/Models/events.dart';
import 'package:unievents/templates/EventTime/eventDesc/eventDesc.dart';
import 'package:unievents/themes/themes.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyContainer(),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  var currentUser = UserController().currentUser;
  final db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          
        },
        child: ListView(children: [
          Column(
            children: [
              FutureBuilder<List<Event>>(
                future: DatabaseHelper().getAllUserEvent(currentUser.usrId!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<Event>? events = snapshot.data;
                    String?
                        oldEvent; // Define oldEvent outside the map function
                    if (events != null && events.isNotEmpty) {
                      return Column(
                        children: events.map((event) {
                          
                          return GestureDetector(
                            onTap:() => Get.to(const SecondPage(heroTag: 1),arguments: event),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            15.0, 70.0, 5.0, 20.0),
                                        width: 380,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                            width: 300,
                                                            height: 51,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  '${event.eventName} ,  ${event.eventType}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 12,
                                                                  ),
                                                                ),
                                                                Row(children: [
                                                                  const Icon(Icons
                                                                      .timelapse_rounded),
                                                                  Text(
                                                                    '${event.eventDate} , ${event.eventStartTime}',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                ]),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 300,
                                                          height: 99,
                                                          padding:
                                                              const EdgeInsets.all(5.0),
                                                          decoration:
                                                              BoxDecoration(
                                                            // color: primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                          ),
                                                          child: Text(
                                                            'Description: ${event.eventDescription}',
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                            IconButton(
                                                        icon: const Icon(
                                                            Icons.exit_to_app,
                                                            color: Colors.red),
                                                        iconSize: 45.0,
                                                        onPressed: ()=>{db.deleteUserEvent(currentUser.usrId!,event.eventId!),
                                                          Get.snackbar('Quit', 'Participation deleted (Reload the page)', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent)}
                                                        ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ])
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(child: Text('No events found.'));
                    }
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ]));
  }
}
