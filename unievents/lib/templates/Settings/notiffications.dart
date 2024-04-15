import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/DB%20&%20Controllers/database_helper.dart';
import 'package:unievents/templates/EventTime/eventDesc/eventDesc.dart';
import 'package:unievents/templates/EventTime/card_event.dart';
import 'package:unievents/themes/themes.dart';

import '../../Models/events.dart';

class NotificationsPage extends StatelessWidget {
  // final List<String>=[] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body:
            ListView(
            children:[ Column(
              children: [
                FutureBuilder<List<Event>>(
                    future: DatabaseHelper().getAllEvents(),
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
                              bool visi = true; // Define visi outside the if statement
                              if(oldEvent != null && event.eventDate == oldEvent){
                                visi = false;
                              }
                              oldEvent = event.eventDate; // Update oldEvent after checking
                        
                              return Column(
                                children: [
                                  Visibility(
                                    visible: visi,
                                    child: Text(event.eventDate.toString()),
                                  ),
                                  GestureDetector(
                                  
                                    child: Card_Event(
                                      label: event.eventName,
                                      discription: event.eventDescription,
                                      type: event.eventType,
                                      date: event.eventDate,
                                      colore: event.color == 0 ? event.color == 1 ? eventColor1: eventColor2 : eventColor3, // Parse and create color,
                                      onTap: ()=>navigateToEventDetails(event),
                                  
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
                  SizedBox(height: 20,),
              ],
            ),
            ]
          )

      
    );
  }
}
void navigateToEventDetails(Event event){
  Get.to(const SecondPage(heroTag: 1,), arguments: event);
}
