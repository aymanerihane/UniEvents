import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:unievents/SQLite/database_helper.dart';
import 'package:unievents/templates/EventTime/eventDesc/eventDesc.dart';
import 'package:unievents/wigets/MyButton.dart';
import 'package:unievents/templates/EventTime/evenement_description.dart';
import 'package:unievents/templates/EventTime/add_event.dart';
import 'package:unievents/templates/EventTime/card_event.dart';
import 'package:unievents/templates/Proposition/Propositions.dart';

import 'package:unievents/themes/themes.dart';

import '../../JSON/events.dart';


class Conferences_Time extends StatefulWidget {
  
  const Conferences_Time({Key? key}) : super(key: key);

  @override
  State<Conferences_Time> createState() => _Event_TimeState();
}

class _Event_TimeState extends State<Conferences_Time> {
  
  // String currentTime = DateFormat('yMMMMd').format(DateTime.now());
  String testTime= DateFormat('hh:mm a').format(DateTime.now().add(Duration(days: 1)));
  String selectedDate = DateFormat('yMMMMd').format(DateTime.now());
  List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  String selectedDay = 'Today';
  

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    const pi = 3.1416;
    return Scaffold(
      appBar: _appBar(),
     body:  Column(
        children: [
          Row(
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
              ),
                    
         
            SizedBox(height: 20,),
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
                        print(DateFormat.yMd().format(date));
                        if (date == DateTime.now())
                          selectedDay = 'Today';
                        else
                          selectedDay = day;

                        selectedDate = DateFormat('yMMMMd').format(date);
                        print(selectedDate);
                      });
                    },
                  ),
                ),
            Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                   onTap: ()=> Get.to(const Evenement_Description(heroTag: 1)),
                    child: Container(
                      width: width*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              width: width*0.66,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Event Title',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children:[ 
                                      Icon(Icons.timelapse_rounded),
                                      Text(
                                       ' 13/04/2024 12:00',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ]
                                  ),
                              
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Text(
                                      'discription: hvjhvjahvsjhvajshvjhbvsjhgvajhsbvfkagskjgbamjsgiua',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 11,),
                            const VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 10,
                              endIndent: 20,
                              indent: 20,
                            ),
                            Container(
                                child: Transform.rotate(
                                  angle: -90 * pi / 180,
                                  child:Text('Type Event',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,),
                                  ),
                                ),
                            )
                      ],
                    ),
                  ),
                ),
              ),
                  ),
            )

              ],
            ),
            
          );
        }
      }

_appBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: const Text('Conference'),
    centerTitle: true,
  );
}

