import 'package:flutter/material.dart';
import 'package:unievents/wigets/MyButton.dart';





class Evenement_Description extends StatelessWidget {
  final int heroTag;
  const Evenement_Description ({required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/default.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
            SizedBox(height: 20.0),
            Text(
              'Event Name',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Date: January 1, 2025',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Location: New York City',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis ante in sem congue gravida. Vestibulum sollicitudin ut felis nec elementum.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              MyButton(label: "Participate" , onTap: null,visibility: true,),
            
            ],)
            
          ],
        ),
      ),
    );
  }
}
