/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_player/src/custom/custom.dart';
import 'package:quran_player/src/features/player/player_screen.dart';
import 'package:quran_player/src/features/playlist/cubit/playlist_cubit.dart';
import 'package:quran_player/src/playlist_repository/playlist_repository.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PlaylistCubit(repository: context.read<PlaylistRepository>()),
      child: Scaffold(
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
                height: 150,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.short_text_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "PlayList",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Roboto"),
                        ),
                        Icon(
                          Icons.sort_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(25)),
                    )
                  ],
                ),
              ),
              const PlayListView()
            ],
          ),
        ),
      ),
    );
  }
}

List sort = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  '0',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class PlayListView extends StatefulWidget {
  const PlayListView({super.key});

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  @override
  void initState() {
    super.initState();

    context.read<PlaylistCubit>().getAudioPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaylistCubit, PlaylistState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
          child: state.status == PlaylistStatus.loaded ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.90,
                child: ListView.separated(
                  itemCount: state.data!.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlayerScreen(resource: state.data![index], id: index,),
                          ),
                        );
                      },
                      child:  PlayItemWidget(
                        title: state.data![index].publicId!,
                        description: chapName[index],
                      ),
                  ),
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Divider(color: Colors.white, thickness: 0.2),
                  ),

                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.08,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...sort.map(
                      (s) => Text(
                        "$s",
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Roboto"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ) : const SizedBox.shrink(),
        );
      },
    );
  }
}
