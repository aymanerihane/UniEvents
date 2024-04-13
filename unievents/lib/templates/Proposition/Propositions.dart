import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

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
              color: Colors.amber,

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
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black
                        
                        ),
                    )
                  ],
                  ),
                  Row(
                    children: [
                       Container(
                          width:300 ,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue
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
                        color: Colors.brown
                      ),

                    )

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
