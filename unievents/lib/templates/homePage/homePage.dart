import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.fromLTRB(5.0, 70.0, 5.0, 20.0),
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          width: 350,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 214, 243),
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
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.inc.com/uploaded_files/image/1920x1080/getty_499517325_111832.jpg',
                    width: 350,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                child: Text(
                  'CONFERENCE',
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
            ],
          ),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          width: 350,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 214, 243),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(0),
            ),
          ),
          child: Text(
            "Évènement",
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          width: 350,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 214, 243),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(0),
            ),
          ),
          child: Text(
            "Ateliers",
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        )
      ])
    ]));
  }
}
