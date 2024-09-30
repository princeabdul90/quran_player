/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quran_player/src/custom/custom.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.lightGreen,
            AppColors.lightPurple,
          ],
        ),
        ),
      ),
    );
  }
}



