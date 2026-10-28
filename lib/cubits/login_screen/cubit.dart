import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sign_up_model.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = false;
  void changeVisiblePassword() {
    visible = !visible;
    emit(LoginVisiblePasswordState());
  }

  void login(SignUpModel model) async {
    emit(LoginLoadingState());
    try {
      final authUser = FirebaseAuth.instance.currentUser;
      if (authUser == null) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email,
          password: model.password,
        );
      }

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        emit(LoginErrorState('User session is not available.'));
        return;
      }

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (!snapshot.exists) {
        emit(LoginErrorState('User profile not found.'));
        return;
      }

      final profile = SignUpModel.fromJson(snapshot.data() ?? {});
      emit(LoginSuccessState(
        SignUpModel(
          username: profile.username,
          email: currentUser.email ?? model.email,
          password: '',
        ),
      ));
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        emit(LoginErrorState("No user found for this email."));
      } else if (error.code == "wrong-password") {
        emit(LoginErrorState("Wrong password."));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
