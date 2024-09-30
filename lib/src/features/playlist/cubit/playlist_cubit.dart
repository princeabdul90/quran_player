
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_player/src/cloud_api/model/resource_rm.dart';
import 'package:quran_player/src/playlist_repository/playlist_repository.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit({required this.repository}) : super(PlaylistState.initial());

  final PlaylistRepository repository;

  void getAudioPlaylist() async {
    emit(state.copyWith(status: PlaylistStatus.loading));
    try {
      final resources = await repository.getResources();
      print("resources: $resources");
      final data = resources.resources!.where((element) => element.isAudio == true,).toList();
      emit(state.copyWith(status: PlaylistStatus.loaded, data: data));
      print("State: $state");
    }catch (error){}

  }

}
