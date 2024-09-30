/*
* Developer: Abubakar Abdullahi
* Date: 22/09/2024
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quran_player/src/cloud_api/model/resource_rm.dart';
import 'package:quran_player/src/custom/custom.dart';
import 'package:quran_player/src/features/player/bloc/player_bloc.dart';
import 'package:quran_player/src/player_repository/player_repository.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key, required this.resource, required this.id});

  final ResourceRM resource;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerBloc>(
      create: (context) => PlayerBloc(repository: context.read<PlayerRepository>()),
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Player",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Roboto"),
                    ),
                    const Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
               Expanded(child: PlayerView(resource: resource, id: id,))
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerView extends StatefulWidget {
  const PlayerView({super.key, required this.resource, required this.id});

  final ResourceRM resource;
  final int id;

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  @override
  void initState() {
    super.initState();
    context.read<PlayerBloc>().add(LoadEvent(url: widget.resource.secureUrl!));
  }

  int? isPlayOrPauseTapped = 1;


  @override
  Widget build(BuildContext context) {
    final selectedButton =
        context.select((PlayerBloc bloc) => bloc.state.status);
    final isPlaying = context.select((PlayerBloc bloc) => bloc.state.isPlaying);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.lightBlue,
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 5.0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                "01:46",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: "Roboto"),
              ),
            ],
          ),
           Column(
            children: [
              Text(
                getFormattedString(widget.resource.publicId!,),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Roboto"),
              ),
              Gap(10),
              Text(
                chapName[widget.id],
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Roboto"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => context.read<PlayerBloc>().add(RepeatEvent()),
                  child: ButtonIconWidget(
                    icon: Icons.repeat_rounded,
                    isTapped:
                        selectedButton == PlayerStatus.repeat ? true : false,
                  ),
              ),

              GestureDetector(
                  onTap: () => context.read<PlayerBloc>().add(PreviousEvent()),
                  child: ButtonIconWidget(
                    icon: Icons.fast_rewind_outlined,
                    isTapped:
                        selectedButton == PlayerStatus.previous ? true : false,
                  ),
              ),

              if(isPlayOrPauseTapped == 1)
              GestureDetector(
                  onTap: () {
                    setState(()=> isPlayOrPauseTapped = 0);
                    context.read<PlayerBloc>().add(PlayEvent());
                  },
                  child: ButtonIconWidget(
                    icon: Icons.play_arrow_rounded,
                    isTapped: selectedButton == PlayerStatus.play
                        ? true
                        : false,
                  )

              )
              else
                GestureDetector(
                  onTap: () {
                    setState(()=> isPlayOrPauseTapped = 1);
                    context.read<PlayerBloc>().add(PauseEvent());
                  },
                  child: ButtonIconWidget(
                    icon: Icons.pause,
                    isTapped: selectedButton == PlayerStatus.pause
                        ? true
                        : false,
                  ),
                ),


              GestureDetector(
                  onTap: () => context.read<PlayerBloc>().add(NextEvent()),
                  child: ButtonIconWidget(
                    icon: Icons.fast_forward_outlined,
                    isTapped:
                        selectedButton == PlayerStatus.next ? true : false,
                  ),
              ),

              GestureDetector(
                  onTap: () => context.read<PlayerBloc>().add(MuteEvent()),
                  child: ButtonIconWidget(
                    icon: Icons.volume_down_outlined,
                    isTapped:
                        selectedButton == PlayerStatus.mute ? true : false,
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
