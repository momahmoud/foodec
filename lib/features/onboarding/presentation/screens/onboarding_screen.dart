import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../widgets/onboarding_animated_dots_widget.dart';
import '../widgets/onboarding_get_started.dart';
import '../widgets/onboarding_list_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(flex: 2),
            OnboardingListWidget(),
            Spacer(),
            OnboardingAnimatedDotsWidget(),
            Spacer(flex: 2),
            OnBoardingGetStarted(),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
