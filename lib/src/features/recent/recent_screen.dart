/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/

import 'package:flutter/material.dart';
import 'package:quran_player/src/custom/custom.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

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
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.short_text_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Recent",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox.square(),
                ],
              ),
            ),
            const RecentView()
          ],
        ),
      ),
    );
  }
}

class RecentView extends StatelessWidget {
  const RecentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const PlayItemWidget(title: "Surah Baqarah",  description: "description"),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(color: Colors.white, thickness: 0.2),
        ),
        itemCount: 10,
      ),
    );
  }
}
