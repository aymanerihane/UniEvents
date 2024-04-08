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
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 63, 63, 63),fontFamily: "Poppins")),
          Container(
            padding: EdgeInsets.only(left: 8.0 , right: 8.0,top: 5.0,bottom: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    readOnly: widget == null?false:true,
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      hintText: hint,
                      hintStyle: const TextStyle(fontSize: 16, color: Colors.grey ,fontFamily: "Poppins"),
                      
                    ),
                  ),
                ),
                widget==null? Container():Container(child:widget),
              ],
            ),
          ),
          
        ],
      )
    );
  }
}