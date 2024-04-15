import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:unievents/SQLite/database_helper.dart';
import 'package:unievents/templates/EventTime/eventDesc/eventDesc.dart';
import 'package:unievents/userController.dart';
import 'package:unievents/wigets/MyButton.dart';
import 'package:unievents/templates/EventTime/add_event.dart';
import 'package:unievents/templates/EventTime/card_event.dart';
import 'package:unievents/templates/Proposition/Propositions.dart';
import 'package:unievents/themes/themes.dart';

import '../../JSON/events.dart';

class NotificationsPage extends StatelessWidget {
  // final List<String>=[] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body:
          //   ListView(
          //   children:[ Column(
          //     children: [
          //       FutureBuilder<List<Event>>(
          //           future: DatabaseHelper().getEventsByDate(selectedDate),
          //           builder: (context, snapshot) {
          //             if (snapshot.connectionState == ConnectionState.waiting) {
          //               return Center(child: CircularProgressIndicator());
          //             } else if (snapshot.hasError) {
          //               return Center(child: Text('Error: ${snapshot.error}'));
          //             } else {
          //               List<Event>? events = snapshot.data;
          //               if (events != null && events.isNotEmpty) {
          //                 return Column(
          //                   children: events.map((event) {
          //                     return GestureDetector(

          //                       child: Card_Event(
          //                         label: event.eventName,
          //                         discription: event.eventDescription,
          //                         type: event.eventType,
          //                         date: event.eventDate,
          //                         colore: event.color == 0 ? event.color == 1 ? eventColor1: eventColor2 : eventColor3, // Parse and create color,
          //                         onTap: ()=>navigateToEventDetails(event),

          //                       ),
          //                     );
          //                   }).toList(),
          //                 );
          //               } else {
          //                 return Center(child: Text('No events found.'));
          //               }
          //             }
          //           },
          //         ),
          //         SizedBox(height: 20,),
          //     ],
          //   ),
          //   ]
          // );
          Card(
        child: ListTile(
          title: Text("gdgd"),
          onTap: () {},
        ),
      ),
    );
  }
}
