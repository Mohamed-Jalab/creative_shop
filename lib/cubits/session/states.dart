import '../../models/sign_up_model.dart';

abstract class SessionState {}

class SessionInitial extends SessionState {}

class SessionAuthenticated extends SessionState {
  SessionAuthenticated(this.user);

  final SignUpModel user;
}

class SessionUnauthenticated extends SessionState {
  SessionUnauthenticated() : user = SignUpModel(username: 'NULL', email: 'NULL', password: 'NULL');

  final SignUpModel user;
}
