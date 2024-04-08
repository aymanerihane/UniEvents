import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unievents/templates/EventTime/MyButton.dart';
import 'package:unievents/templates/EventTime/add_event.dart';
import 'package:unievents/templates/EventTime/card_event.dart';
import 'package:unievents/themes/themes.dart';


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
          SizedBox(height: 10,),
          Card_Event(label: "Event Title",discription: "klsajdkasdkasdn as skld  jsad fj sdajf  jsadf ljds a askdfj sdkf js kdjf ds fj lksd jfk sdjf lksjd fls lk jasdl kjsld fjd ljksdl j dksljf lksdjf  ñsaldkfj slda fkj",type:"Attelier",date:testTime, onTap: null),
          Card_Event(label: "Event Title",discription: "klsajdkasdkasdn as skld  jsad fj sdajf  jsadf ljds a askdfj sdkf js kdjf ds fj lksd jfk sdjf lksjd fls lk jasdl kjsld fjd ljksdl j dksljf lksdjf  ñsaldkfj slda fkj",type:"Attelier",date:testTime, onTap: null),
          Card_Event(label: "Event Title",discription: "klsajdkasdkasdn as skld  jsad fj sdajf  jsadf ljds a askdfj sdkf js kdjf ds fj lksd jfk sdjf lksjd fls lk jasdl kjsld fjd ljksdl j dksljf lksdjf  ñsaldkfj slda fkj",type:"Attelier",date:testTime, onTap: null),
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
              const MyButton(label: "proposition", onTap: null,visibility: true,),
              const SizedBox(width: 20,),
              MyButton(label: "+ add Event" , onTap: ()=> Get.to(const Add_event()),visibility: true,),
            ],
          ),
        ),
      ],
    );
  }
}