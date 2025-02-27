import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/templates/EventTime/event_timeByCategory.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap:  ()=>Get.to(() => const Event_TimeByCategorie(type:"Conference")),
        
        child:  Container(
          margin: EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 20.0),
          width: 350,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(0),
            ),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                  ),
                  child: Image.asset(
                    'assets/images/conference.jpg',
                    width: 350,
                    height: 170,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                child: Text(
                  'CONFERENCE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
       GestureDetector(
          onTap:  ()=>Get.to(() => const Event_TimeByCategorie(type:"Evenement")),
        
        child:  Container(
          margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 20.0),
          width: 350,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(0),
            ),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                  ),
                  child: Image.asset(
                    'assets/images/events.jpg',
                    width: 350,
                    height: 170,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                child: Text(
                  'EVENEMENT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        )
      ]
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap:  ()=>Get.to(() => const Event_TimeByCategorie(type:"Attelier")),
        
        child:  Container(
          margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 20.0),
          width: 350,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(0),
            ),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                  ),
                  child: Image.asset(
                    'assets/images/Ateliers2.jpeg',
                    width: 350,
                    height: 170,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                child: Text(
                  'Ateliers',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        )
      ])
    ]));
  }
}
