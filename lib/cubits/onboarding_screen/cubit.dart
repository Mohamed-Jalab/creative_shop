import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitialState());

  PageController controller = PageController();
  bool isLast = false;

  onPageChanged(int index) {
    if (index == 2) {
      isLast = true;
      emit(OnboardingLastPageState());
    } else {
      isLast = false;
      emit(OnboardingLastPageState());
    }
  }
}
