import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/templates/EventTime/MyButton.dart';
import 'package:unievents/themes/themes.dart';
import 'package:unievents/wigets/input.dart';
import 'package:intl/intl.dart';

class Add_event extends StatefulWidget {
  const Add_event({super.key});

  @override
  State<Add_event> createState() => _Add_eventState();
}

class _Add_eventState extends State<Add_event> {

  DateTime _selectedDate = DateTime.now();
  String _selectedStartTime = DateFormat('hh:mm a').format(DateTime.now());
  String _selectedEndTime ='12:00 PM';
  int _selectedReminder = 5;
  List<int> remindList=[5,10,15,20,30,60];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None","Daily","Weekly","Monthly","Yearly"];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyInput(
              hint: 'Enter Event Title',
              title: 'Event Title',
            ),
            const MyInput(
              hint: 'add discriptiom',
              title: 'Event Description',
            ),
            MyInput(
              hint: DateFormat.yMd().format(_selectedDate),
              title: 'Date',
              widget: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null && picked != _selectedDate){
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyInput(
                    title: 'Start Time', 
                    hint: _selectedStartTime,
                    widget: IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: ()  {
                        _selectTimePicker(true);
                      },
                    ),
                    )
                ),
                Expanded(child: 
                  MyInput(
                    title: 'End Time', 
                    hint: _selectedEndTime,
                    widget: IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: (){
                        _selectTimePicker(false);
                      },
                    ),
                  )  
                ),
              ],
            ),
            MyInput(title: 'Select Reminder', hint: '$_selectedReminder minutes early',
            widget:
              DropdownButton<int>(
                icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                iconSize: 30,
                elevation:4,
                underline: Container(height: 0.0,),
                items: remindList.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? value) {
                  setState(() {
                    _selectedReminder = value!;
                  });
                },
              ),
            ),
            MyInput(title: 'Repeat', hint: _selectedRepeat,
            widget:
              DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                iconSize: 30,
                elevation:4,
                underline: Container(height: 0.0,),
                items: repeatList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRepeat = value!;
                  });
                },
              ),
            ),
            
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Color',style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 63, 63, 63),fontFamily: "Poppins")),
                      Wrap(
              
                        children: List<Widget>.generate(3, (index) => 
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            
                            child: Padding(
                              padding: const EdgeInsets.only(right:10.0),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: index == 0 ? Colors.blue : index == 1 ? Colors.red : primaryColor,
                                child: _selectedColor==index ? Icon(Icons.check, color: Colors.white, size: 20,): Container(),
                              ),
                            ),
                          )
                        ),
                      ),
                    ],
              
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: MyButton(label: "Create Event", onTap: ()=>Get.back() , visibility: true))
                ],
              ),
            )
          ],
        ),
      ]
      ),
    );
  }
  _selectTimePicker(bool is_start_time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null){
      if(is_start_time){
        setState(() {
          _selectedStartTime = picked.format(context);
        });
      }else{
        setState(() {
          _selectedEndTime = picked.format(context);
        });
      
      }
    }
  }
}


_appBar(){
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ), 
    title: const Text('Add Event'),
    centerTitle: true,
  );
}
