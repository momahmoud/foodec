import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/onboarding_cubit.dart';
import 'onboarding_content_widget.dart';

class OnboardingListWidget extends StatelessWidget {
  const OnboardingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final onboardingCubit = context.read<OnboardingCubit>();
          return PageView.builder(
            itemCount: onboardingCubit.onboardingList.length,
            onPageChanged: (value) {
              onboardingCubit.changeIndex(value);
            },
            itemBuilder: (context, index) {
              final onboardingData = onboardingCubit.onboardingList[index];
              return OnboardContent(
                illustration: onboardingData['illustration'],
                title: onboardingData['title'],
                text: onboardingData['text'],
              );
            },
          );
        },
      ),
    );
  }
}
