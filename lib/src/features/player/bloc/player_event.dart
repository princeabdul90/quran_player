part of 'player_bloc.dart';

sealed class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadEvent extends PlayerEvent {
  final String url;

  const LoadEvent({
    required this.url,
  });
}
class PlayEvent extends PlayerEvent {}
class PauseEvent extends PlayerEvent {}
class NextEvent extends PlayerEvent {}
class PreviousEvent extends PlayerEvent {}
class RepeatEvent extends PlayerEvent {}
class StopEvent extends PlayerEvent {}
class MuteEvent extends PlayerEvent {}