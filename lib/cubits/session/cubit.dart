import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sign_up_model.dart';
import '../../repositories/auth_repository.dart';
import 'states.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._repository) : super(SessionInitial());

  final AuthRepository _repository;
  SignUpModel user = SignUpModel(username: 'NULL', email: 'NULL', password: 'NULL');

  Future<void> initialize() async {
    final loggedIn = await _repository.isLoggedIn();
    if (loggedIn) {
      user = await _repository.loadUser();
      emit(SessionAuthenticated(user));
      return;
    }
    emit(SessionUnauthenticated());
  }

  Future<void> logIn(SignUpModel model) async {
    user = model;
    await _repository.saveUser(model);
    emit(SessionAuthenticated(user));
  }

  Future<void> logOut() async {
    user = SignUpModel(username: 'NULL', email: 'NULL', password: 'NULL');
    await _repository.clearUser();
    emit(SessionUnauthenticated());
  }

  Future<void> setGoogleUser(SignUpModel model) async {
    user = model;
    await _repository.saveUser(model);
    emit(SessionAuthenticated(user));
  }
}
