import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.playlist);

  void setTab(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return emit(HomeState.recent);
      case 1:
        return emit(HomeState.playlist);
      case 2:
        return emit(HomeState.favorite);
      case 3:
        return emit(HomeState.setting);
    }
  }
}
