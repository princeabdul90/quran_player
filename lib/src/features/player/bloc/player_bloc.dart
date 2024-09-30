import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_player/src/player_repository/player_repository.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {

  final PlayerRepository repository;

  PlayerBloc({required this.repository}) : super(PlayerState.initial()) {
    on<LoadEvent>(_onLoad);
    on<PlayEvent>(_onPlay);
    on<PauseEvent>(_onPause);
    on<NextEvent>(_onNext);
    on<PreviousEvent>(_onPrevious);
    on<RepeatEvent>(_onRepeat);
    on<StopEvent>(_onStop);
    on<MuteEvent>(_onMute);
  }

  void _onLoad(LoadEvent event, Emitter<PlayerState> emit) async {
    await repository.load(event.url);
    emit(state.copyWith(status: PlayerStatus.load));
  }
  void _onPlay(PlayEvent event, Emitter<PlayerState> emit) async {
    await repository.play();
    emit(state.copyWith(status: PlayerStatus.play, isPlaying: true));
  }
  void _onPause(PauseEvent event, Emitter<PlayerState> emit) async{
    await repository.pause();
    emit(state.copyWith(status: PlayerStatus.pause, isPlaying: false));
  }
  void _onStop(event, Emitter<PlayerState> emit) {
    emit(state.copyWith(status: PlayerStatus.stop));
  }
  void _onNext(event, Emitter<PlayerState> emit) {
    emit(state.copyWith(status: PlayerStatus.next));
  }
  void _onPrevious(event, Emitter<PlayerState> emit) {
    emit(state.copyWith(status: PlayerStatus.previous));
  }
  void _onRepeat(event, Emitter<PlayerState> emit) {
    emit(state.copyWith(status: PlayerStatus.repeat));
  }
  void _onMute(event, Emitter<PlayerState> emit) {
    emit(state.copyWith(status: PlayerStatus.mute));
  }


}
