import 'dart:async';

import 'package:creative_shop/screens/home.dart';
import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/session/cubit.dart';
import '../cubits/session/states.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() {
        opacity = 1;
      }),
    );
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        final isLoggedIn = context.read<SessionCubit>().state is SessionAuthenticated;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            if (isLoggedIn) return const Home();
            return const OnboardingScreen();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = context.watch<SessionCubit>().state;
    final isLoggedIn = sessionState is SessionAuthenticated;

    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 900),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset('asset/images/logo-no-background.png'),
          ),
        ),
      ),
    );
  }
}
