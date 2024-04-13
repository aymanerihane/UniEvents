
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unievents/SQLite/database_helper.dart';
import 'package:unievents/templates/EventTime/eventDesc/eventDesc.dart';
import 'package:unievents/wigets/MyButton.dart';
import 'package:unievents/templates/EventTime/add_event.dart';
import 'package:unievents/templates/EventTime/card_event.dart';
import 'package:unievents/templates/Proposition/Propositions.dart';
import 'package:unievents/themes/themes.dart';

import '../../JSON/events.dart';


class Event_Time extends StatefulWidget {
  const Event_Time({Key? key}) : super(key: key);

  @override
  State<Event_Time> createState() => _Event_TimeState();
}

class _Event_TimeState extends State<Event_Time> {
  // String currentTime = DateFormat('yMMMMd').format(DateTime.now());
  String testTime= DateFormat('hh:mm a').format(DateTime.now().add(Duration(days: 1)));
  String selectedDate = DateFormat('yMMMMd').format(DateTime.now());
  List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  String selectedDay = 'Today';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[ Column(
        children: [
          topEventTimePicker(),
          time_Picker(),
          FutureBuilder<List<Event>>(
              future: DatabaseHelper().getEventsByDate(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Event>? events = snapshot.data;
                  if (events != null && events.isNotEmpty) {
                    return Column(
                      children: events.map((event) {
                        return GestureDetector(
                          
                          child: Card_Event(
                            label: event.eventName,
                            discription: event.eventDescription,
                            type: event.eventType,
                            date: event.eventDate,
                            colore: event.color,
                            onTap: ()=>navigateToEventDetails(event),
                          ),
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
    );
  }

Widget time_Picker(){
  return         //time picker
       Container(
        margin: const EdgeInsets.only(top: 20,left:30),
        child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryColor,
            selectedTextColor: Colors.white,
            dateTextStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
            onDateChange: (date) {
              

              setState(() {
                var day= daysOfWeek[date.weekday - 1];
                if (date.weekday == DateTime.now().weekday)
                  selectedDay = 'Today';
                else
                  selectedDay = day;

                selectedDate = DateFormat('yMMMMd').format(date);
                print(selectedDate);
              });
            },
          ),
        );
}


Widget topEventTimePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              selectedDate,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontFamily: "Poppins",
              ),
            ),

            Text(selectedDay,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2F2F),
                    fontFamily: "lato")),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               MyButton(label: "proposition", onTap: ()=> Get.to(const Propositions()),visibility: true,),
              const SizedBox(width: 20,),
              MyButton(label: "+ add Event" , onTap: ()=> Get.to(const Add_event()),visibility: true,),
            ],
          ),
        ),
      ],
    );
  }
}

void navigateToEventDetails(Event event){
  Get.to(const EventDescription(), arguments: event);
}