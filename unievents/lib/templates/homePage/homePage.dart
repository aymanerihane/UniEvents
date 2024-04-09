import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
           children: [
           Container(
            margin: EdgeInsets.fromLTRB(5.0, 70.0,5.0,20.0),
            padding: EdgeInsets.fromLTRB(40.0,20.0,40.0,20.0),
          
            width: 350,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 214, 243),
                borderRadius: BorderRadius.circular(10.0),
            ),
                        
           child: Text("Conferences" ,
              style : TextStyle(
                color: Colors.white,
                fontSize: 40.0
                

                ),
              ),
            )    
         ]
        ),
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
           children: [
           Container(
            margin: EdgeInsets.fromLTRB(5.0, 20.0,5.0,20.0),
            padding: EdgeInsets.fromLTRB(40.0,20.0,40.0,20.0),
          
            width: 350,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 214, 243),
                borderRadius: BorderRadius.circular(10.0),
            ),
                        
            child: Text("Évènement" ,
              style : TextStyle(
                color: Colors.white,
                fontSize: 40.0
                

                ),
              ),
            )    
         ]

        ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
           children: [
           Container(
            margin: EdgeInsets.fromLTRB(5.0, 20.0,5.0,20.0),
            padding: EdgeInsets.fromLTRB(40.0,20.0,40.0,20.0),
          
            width: 350,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 214, 243),
                borderRadius: BorderRadius.circular(10.0),
            ),
                        
            child: Text("Ateliers" ,
              style : TextStyle(
                color: Colors.white,
                fontSize: 40.0
                ),
              ),
            )    
         ]

        )
         
       ]

      )
    );
  }
}