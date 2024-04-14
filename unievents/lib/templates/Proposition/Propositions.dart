import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Propositions extends StatelessWidget{

const Propositions({super.key});
@override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Container(
            margin: EdgeInsets.fromLTRB(15.0,70.0 ,5.0,20.0),
           width: 380,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
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
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.only(left: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                         borderRadius: BorderRadius.circular(10),      
                        ),
                        child: Column(
                          children: [
                            Text(
                          'Event Title ,  Type of Event',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                         Row(
                          children:[ 
                            Icon(Icons.timelapse_rounded),
                            Text(
                              '13/04/2024 12:00',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ]
                        ),
                          ],
                        )
                         
                    )
                  ],
                  ),
                  Row(
                    children: [
                       Container(
                          width:300 ,
                          height: 100,
                          padding: EdgeInsets.only(left: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                             borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                          'Description: hjvjhvmabshvjhavmn jhavjdhvasmdnabshbkajbsmdnabmsn bmahbsdkabmsnbdmasbdmahbsmda',
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
                        color: Colors.blue,
                         borderRadius: BorderRadius.circular(10),
                      ),
                     child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                             const VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                                width: 10,
                                endIndent: 20,
                                indent: 20,
                              ),
                               SizedBox(width: 12),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Icon(
                              Icons.delete_forever,                          
                              size: 45.0,
                              ),
                               SizedBox(width: 20),
                            Icon(
                              Icons.check,
                              size: 45.0,
                              ),


                          ],

                        )
                        ],
                        ),
                     
                      
                    ),
                    
                  ],
                ),

                
              ],
            ),
          )
          ]
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
    title: const Text('Propositions'),
    centerTitle: true,
  );
}