/*
* Developer: Abubakar Abdullahi
* Date: 22/09/2024
*/

import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({super.key, required this.icon, required this.isTapped});

  final IconData icon;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration:  BoxDecoration(
        color: isTapped == true ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child:  Center(child: Icon(icon, size: 30, color: isTapped == true ? Colors.black87 : Colors.white,),),
    );
  }
}
