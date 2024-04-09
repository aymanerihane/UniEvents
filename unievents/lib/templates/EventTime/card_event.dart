import 'package:flutter/material.dart';
import 'package:unievents/themes/themes.dart';

class Card_Event extends StatelessWidget {
  final String label;
  final String discription;
  final String type;
  final String date;
  final Function()? onTap;
  const Card_Event({super.key, required this.label, required this.onTap, required this.discription, required this.type, required this.date});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    const pi = 3.1416;
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: width*0.9,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF2196F3),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: width*0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            label,
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
                              date,
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
                            discription,
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
                        child:Text(type,
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
      );
  }
}