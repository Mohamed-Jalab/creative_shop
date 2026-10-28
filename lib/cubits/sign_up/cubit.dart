import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sign_up_model.dart';
import '../../repositories/auth_repository.dart';
import 'states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool visible = false;
  void changeVisiblePassword() {
    visible = !visible;
    emit(SignUpVisiblePasswordState());
  }

  void signUp(SignUpModel model) async {
    try {
      emit(SignUpLoadingState());
      final auth = FirebaseAuth.instance;
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      final userRef = FirebaseFirestore.instance.collection('users');
      await userRef.doc(userCredential.user!.uid).set(
        AuthRepository.toProfile(model),
      );

      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        emit(SignUpErrorState("Your password is weak"));
      } else if (e.code == "email-already-in-use") {
        emit(SignUpErrorState("The account already exists for that email."));
      }
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
