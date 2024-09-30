part of 'player_bloc.dart';

enum PlayerStatus {
  initial,
  load,
  play,
  pause,
  next,
  previous,
  repeat,
  stop,
  mute
}

class PlayerState extends Equatable {
  final PlayerStatus status;
  final bool? isPlaying;

  const PlayerState({
    required this.status,
    this.isPlaying
  });

  factory PlayerState.initial(){
    return const PlayerState(status: PlayerStatus.initial);
  }

  PlayerState copyWith({
    PlayerStatus? status,
    bool? isPlaying,
  }) {
    return PlayerState(
        status: status ?? this.status,
        isPlaying: isPlaying ?? this.isPlaying
    );
  }

  @override
  String toString() {
    return 'PlayerState{status: $status, isPlaying: $isPlaying}';
  }

  @override
  List<Object?> get props => [status, isPlaying];
}

