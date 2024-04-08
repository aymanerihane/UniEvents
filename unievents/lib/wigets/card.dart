import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  final List<String> cardTitles = [
    'Card 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: Card(
            child: ListTile(
              title: Text("gdgd"),
              onTap: () {
              },
          ),
      ),
    );
  }
}
