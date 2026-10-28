import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/sign_up/cubit.dart';
import '../cubits/sign_up/states.dart';
import '../models/sign_up_model.dart';
import '../shared/component.dart';
import '../shared/constant.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            message(context, "Sign up successfully");
            Navigator.of(context).pop();
          } else if (state is SignUpErrorState) {
            message(context, state.error);
          }
        },
        builder: (context, state) {
          SignUpCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(height: 20),
                    const Text('Welcome to Creative Shop!',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 40),
                    buildTextField(
                      controller: cubit.usernameController,
                      text: 'Username',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      controller: cubit.emailController,
                      text: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      controller: cubit.passwordController,
                      obscure: !cubit.visible,
                      text: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(
                            !cubit.visible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: greyColor2,
                          ),
                          onPressed: () => cubit.changeVisiblePassword(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      controller: cubit.confirmPasswordController,
                      obscure: !cubit.visible,
                      text: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 15),
                    buildBigButton(context, onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (cubit.passwordController.text !=
                          cubit.confirmPasswordController.text) {
                        message(context, "Uncorrect confirm password");
                      } else if (cubit.usernameController.text != '' &&
                          cubit.emailController.text != '' &&
                          cubit.passwordController.text != '' &&
                          cubit.confirmPasswordController.text != '') {
                        SignUpModel userModel = SignUpModel(
                            username: cubit.usernameController.text,
                            email: cubit.emailController.text,
                            password: cubit.passwordController.text);
                        cubit.signUp(userModel);
                      } else {
                        message(context, "Complete all fields");
                      }
                    },
                        height: 48,
                        child: const Text('Sign Up',
                            style:
                            TextStyle(fontSize: 16, fontFamily: "Poppins")),
                        color: secondaryColor),
                    const SizedBox(height: 10),
                    if (state is SignUpLoadingState)
                      LinearProgressIndicator(
                        color: secondaryColor,
                        backgroundColor: secondaryColor.withValues(alpha: 0.2),
                      ),
                    const SizedBox(height: 30),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                            fontSize: 12),
                        children: [
                          TextSpan(
                            text: "By Signing up you agree to our ",
                            // style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: "Terms & Conditions ",
                            style: TextStyle(color: secondaryColor),
                          ),
                          TextSpan(
                            text: "and ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: secondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
