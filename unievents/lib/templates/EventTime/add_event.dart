import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/DB%20&%20Controllers/database_helper.dart';
import 'package:unievents/wigets/MyButton.dart';
import 'package:unievents/themes/themes.dart';
import 'package:unievents/wigets/input.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../Models/events.dart'; 

class Add_event extends StatefulWidget {
  final bool isProp;
  const Add_event({super.key, required this.isProp});

  @override
  State<Add_event> createState() => _Add_eventState();
}

class _Add_eventState extends State<Add_event> {

  // Get the value of isProp from the widget
  bool get isProp => widget.isProp;

  //controllers
  final _eventTitle = TextEditingController();
  final _eventDiscription = TextEditingController();
  final _otherType = TextEditingController();

  //Date and Time
  DateTime _selectedDate = DateTime.now();
  String _selectedStartTime = DateFormat('hh:mm a').format(DateTime.now());
  String _selectedEndTime = '12:00 PM';
  int _dayOfWeek = DateTime.now().weekday;
  int _dayOfMonth = DateTime.now().day;
  int _month = DateTime.now().month;


  //Reminder

  //Repeat
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly", "Yearly"];

  //Color
  int _colorindex = 0;

  //Type
  String _selectedType = "Attelier";
  List<String> typeList = ["Attelier", "Evenement", "Conference", "Others"];


  //file 
  String _pathImage = 'default.jpg';
  var fileByte = null;
  PlatformFile? file ;
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.single;
      final pickedFile = File(file!.path!);
      fileByte = await pickedFile.readAsBytes();
      setState(() {
        _pathImage = result.files.first.name.toString();
      });
    }
        
  }
  var directory;
  var path ;
  var filePath ;
  var localFile ;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInput(
              controller: _eventTitle,
              hint: 'Enter Event Title',
              title: 'Event Title *',
            ),
            MyInput(
              controller: _eventDiscription,
              hint: 'add discriptiom',
              title: 'Event Description *',
            ),
            MyInput(title: 'Cover *', hint: _pathImage ,widget:ElevatedButton.icon(
                    onPressed: (){
                      picksinglefile();
                      
                      
                      },
                    
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color.fromARGB
                            (255, 61, 186, 228))),
                    icon: const Icon(Icons.insert_drive_file_sharp),
                    label: const Text(
                      'Pick File',
                      style: TextStyle(fontSize: 25),
                    )),),
            MyInput(
              title: 'Select Type',
              hint: _selectedType,
              widget: DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                iconSize: 30,
                elevation: 4,
                underline: Container(
                  height: 0.0,
                ),
                items: typeList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
            ),
            Visibility(
              visible: _selectedType == 'Others',
              child: 
                MyInput(
                  controller: _otherType,
                  hint: 'Enter Type',
                  title: 'Other Type *',
                ),
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
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                      _dayOfWeek = picked.weekday;
                      _dayOfMonth = picked.day;
                      _month =picked.month;
                      
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
                    onPressed: () {
                      _selectTimePicker(true);
                    },
                  ),
                )),
                Expanded(
                    child: MyInput(
                  title: 'End Time',
                  hint: _selectedEndTime,
                  widget: IconButton(
                    icon: const Icon(Icons.access_time),
                    onPressed: () {
                      _selectTimePicker(false);
                    },
                  ),
                )),
              ],
            ),
            
            MyInput(
              title: 'Repeat',
              hint: _selectedRepeat,
              widget: DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                iconSize: 30,
                elevation: 4,
                underline: Container(
                  height: 0.0,
                ),
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
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Color',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 63, 63, 63),
                              fontFamily: "Poppins")),
                      Wrap(
                        children: List<Widget>.generate(
                            3,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      
                                       _colorindex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: index == 0
                                          ? eventColor1
                                          : index == 1
                                              ? eventColor2
                                              : eventColor3,
                                         
                                      child: _colorindex == index ? const Icon(Icons.check,color: Colors.black,size: 20,) : Container(),
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: MyButton(
                          label: "Create Event",
                          onTap: () async => {


                          //file
                          // Get the application documents directory
                          if (file != null) {
                          directory = await getApplicationDocumentsDirectory(),
                          path = directory.path,
                          filePath = '$path/${file!.name}',
                          localFile = File(filePath),


                          // Check if file.bytes is not null before using it
                          if (fileByte != null) {
                            await localFile.writeAsBytes(fileByte),
                            print('File saved at $filePath'),
                          } else {
                            print('File bytes is null'),
                          }
                          } else {
                            print('File is null'),
                          },

                          // Validate input
                          if (_eventTitle.text.isEmpty || _eventDiscription.text.isEmpty || file == null || (_selectedType == 'others' && _otherType.text.isEmpty)) {
                            //erreur message
                            Get.snackbar('Erreur', 'Veuillez remplir tous les champs avec une *',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent),
                            
                            

                          }else{
                            // Show a snackbar
                          Get.snackbar('Event Created', 'Event has been created successfully',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.greenAccent),
                          print(isProp ? 'Proposition' : 'Event'),
                          
                          _addEvent(isProp),
                          print('event created'),
                          Get.back(),

                          }

                          
                          },
                          visibility: true))
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
  
Future<void> _addEvent(is_Pro) async {

    


    // Create an Event object
    Event event = Event(
      eventName: _eventTitle.text,
      eventDescription: _eventDiscription.text,
      eventType: _otherType.text.trim() == '' ? _selectedType : _otherType.text,
      eventDate: DateFormat('yMMMMd').format(_selectedDate),
      eventStartTime: _selectedStartTime,
      eventEndTime: _selectedEndTime,
      repeat: _selectedRepeat,
      dayOfWeek: _dayOfWeek,
      dayOfMonth: _dayOfMonth,
      month: _month,
      color: _colorindex,
      eventImage: filePath,
      isProposition: is_Pro ? 1 : 0,
      // Set other event details
    );

    // Insert the event into the database
    await DatabaseHelper().insertEvent(event);

    // Navigate back to the previous page
    Navigator.pop(context);
  }

  

  _selectTimePicker(bool isStart_time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      if (isStart_time) {
        setState(() {
          _selectedStartTime = picked.format(context);
        });
      } else {
        setState(() {
          _selectedEndTime = picked.format(context);
        });
      }
    }
  }
  @override
  void dispose() {
    _otherType.dispose();
    _eventTitle.dispose();
    _eventDiscription.dispose();
    // Dispose other controllers
    super.dispose();
  }

}

_appBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: const Text('Add Event'),
    centerTitle: true,
  );
}

