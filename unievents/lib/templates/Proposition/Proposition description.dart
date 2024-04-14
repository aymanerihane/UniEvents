import 'package:flutter/material.dart';
import 'package:unievents/wigets/MyButton.dart';
import 'package:get/get.dart';

final List<String> _images = [
  'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/273935/pexels-photo-273935.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];

class PropositionDesc extends StatelessWidget {
  final int heroTag;
  const PropositionDesc({super.key,required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event details")),
      body: Column(
        children: [
          Expanded(
            child: Center(
            child: Hero(
                tag: heroTag,
                child: Image.network(_images[heroTag]),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: const Icon(Icons.delete_forever, color: Colors.red),
                iconSize: 90.0,
                onPressed: () => Get.back(),
               ),
             IconButton(
                 icon: const Icon(Icons.check_box, color: Colors.green),
                 iconSize: 90.0,
                 onPressed: () => Get.back(),
                ),


          ],
         )
        ],
      ),
    );
  }
}
