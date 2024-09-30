part of 'playlist_cubit.dart';

enum PlaylistStatus { initial, loading, loaded, error }

class PlaylistState extends Equatable {

  final PlaylistStatus status;
  final List<ResourceRM>? data;

  const PlaylistState({
    required this.status,
    this.data,
  });

  factory PlaylistState.initial() {
    return const PlaylistState(status: PlaylistStatus.initial,);
  }

  PlaylistState copyWith({
    PlaylistStatus? status,
    List<ResourceRM>? data,
  }) {
    return PlaylistState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, data];
}
