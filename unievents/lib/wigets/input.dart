import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String  hint ;
  final String title;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInput({Key? key, required this.title, required this.hint, this.controller, this.widget}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 63, 63, 63),fontFamily: "Poppins")),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey ,fontFamily: "Poppins"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          widget ?? Container(),
        ],
      )
    );
  }
}