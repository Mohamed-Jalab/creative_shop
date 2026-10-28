import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarStates> {
  BottomNavBarCubit() : super(BottomNavBarInitialState());
  int index = 1;
  void changeTab(int i) {
    index = i;
    emit(BottomNavBartSelectedState());
  }
}
