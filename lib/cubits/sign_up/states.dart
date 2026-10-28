
abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpVisiblePasswordState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  // SignUpModel model;
  // SignUpSuccessState(this.model);
}

class SignUpErrorState extends SignUpStates {
  String error;
  SignUpErrorState(this.error);
}
