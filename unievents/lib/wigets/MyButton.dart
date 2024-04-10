import 'package:flutter/material.dart';
import 'package:unievents/themes/themes.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool visibility;
  const MyButton({super.key,required this.label,required this.onTap,required this.visibility});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 90,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: secondaryColor,
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        )
      ),
    );
  }
}