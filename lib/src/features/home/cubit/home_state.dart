part of 'home_cubit.dart';

enum HomeState {
  recent(0),
  playlist(1),
  favorite(2),
  setting(3);

  const HomeState(this.tabIndex);
  final int tabIndex;
}
