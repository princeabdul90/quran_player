/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran_player/src/custom/custom.dart';

class PlayItemWidget extends StatelessWidget {
  const PlayItemWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getFormattedString(title),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Roboto"),
              ),
               Text(
                description,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Roboto"),
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
      ),
      //color: Colors.white12,
    );
  }


}

