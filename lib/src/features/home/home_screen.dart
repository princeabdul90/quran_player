/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_player/src/features/favorites/favorites_screen.dart';
import 'package:quran_player/src/features/home/cubit/home_cubit.dart';
import 'package:quran_player/src/features/navigation/navigation.dart';
import 'package:quran_player/src/features/playlist/playlist_screen.dart';
import 'package:quran_player/src/features/recent/recent_screen.dart';
import 'package:quran_player/src/features/setting/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: const [
            RecentScreen(),
            PlaylistScreen(),
            FavoritesScreen(),
            SettingScreen()
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: selectedTab,
          onTap: (int value) => context.read<HomeCubit>().setTab(value),
        ),
      ),
    );
  }
}
