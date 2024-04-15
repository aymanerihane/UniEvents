import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/DB%20&%20Controllers/database_helper.dart';
import 'package:unievents/templates/Proposition/Proposition%20description.dart';
import '../../Models/events.dart';
import 'package:unievents/themes/themes.dart';

class MyPropositions extends StatelessWidget {
  const MyPropositions({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(children: [
        Column(
          children: [
            FutureBuilder<List<Event>>(
              future: DatabaseHelper().getAllUserEvent(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Event>? events = snapshot.data;
                  String? oldEvent; // Define oldEvent outside the map function
                  if (events != null && events.isNotEmpty) {
                    return Column(
                      children: events.map((event) {
                        bool visi =
                            true; // Define visi outside the if statement
                        if (oldEvent != null && event.eventDate == oldEvent) {
                          visi = false;
                        }
                        oldEvent =
                            event.eventDate; // Update oldEvent after checking

                        return Column(
                          children: [
                            Visibility(
                              visible: visi,
                              child: Text(event.eventDate.toString()),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(PropositionDesc(heroTag: 0,event:event)),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
                                width: 380,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                                    padding: EdgeInsets.all(5.0),
                                                    decoration: BoxDecoration(
                                                      // color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          '${event.eventName} ,  ${event.eventType}',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Row(children: [
                                                          Icon(Icons
                                                              .timelapse_rounded),
                                                          Text(
                                                            '${event.eventDate} ${event.eventStartTime}',
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
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
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    // color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  child: Text(
                                                    'Description: ${event.eventDescription}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 80,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            // color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const VerticalDivider(
                                                color: Colors.white,
                                                thickness: 1,
                                                width: 10,
                                                endIndent: 20,
                                                indent: 20,
                                              ),
                                              SizedBox(width: 9),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      icon: const Icon(
                                                          Icons.delete_forever,
                                                          color: Colors.red),
                                                      iconSize: 45.0,
                                                      onPressed: null),
                                                  IconButton(
                                                      icon: const Icon(
                                                          Icons.check_box,
                                                          color: Colors.green),
                                                      iconSize: 45.0,
                                                      onPressed: null),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  } else {
                    return Center(child: Text('No events found.'));
                  }
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ]),
    );
  }
}

_appBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: const Text('My Propositions'),
    centerTitle: true,
  );
}
