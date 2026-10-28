import 'package:creative_shop/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cubits/onboarding_screen/cubit.dart';
import '../cubits/onboarding_screen/states.dart';
import '../shared/component.dart';
import '../shared/constant.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnboardingCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: cubit.onPageChanged,
                  controller: cubit.controller,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: pageWithGradient(
                        context,
                        image: "${index + 1}.jpg",
                        title: titles[index],
                        subtitle: subtitles[index],
                      ),
                    );
                  },
                  itemCount: 3,
                ),
                Positioned(
                  right: 10,
                  top: 30,
                  child: TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: whiteColor,
                    ),
                    child: const Text('Skip'),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      activeDotColor: secondaryColor,
                      dotColor: whiteColor,
                    ),
                    controller: cubit.controller,
                    count: 3,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (!cubit.isLast) {
                        cubit.controller.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.linearToEaseOut);
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                            // !here put cache
                          ),
                        );
                      }
                    },
                    splashColor: whiteColor.withOpacity(.2),
                    hoverColor: whiteColor.withOpacity(.2),
                    focusColor: whiteColor.withOpacity(.2),
                    backgroundColor: secondaryColor,
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// check