/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/
import 'package:flutter/material.dart';
import 'package:quran_player/src/custom/custom.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.lightPurple,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Recent'),
        BottomNavigationBarItem(
            icon: Icon(Icons.queue_music), label: 'Play List'),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
