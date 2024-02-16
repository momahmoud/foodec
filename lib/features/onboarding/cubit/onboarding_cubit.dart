import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/images_constants.dart';
import '../../../core/constants/strings_constants.dart';
import '../../../core/utils/shared_prefs.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial(0));
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    emit(OnboardingState.initial(index));
  }

  void seen() {
    SharedPreferencesService.saveData(AppConstants.onboardingSeen, true);
    emit(const OnboardingState.seen(true));
  }

  List<Map<String, dynamic>> onboardingList = [
    {
      "illustration": ImagesConstants.onboarding1,
      "title": StringsConstants.onboardingTitle1,
      "text": StringsConstants.onboardingSubtitle1,
    },
    {
      "illustration": ImagesConstants.onboarding2,
      "title": StringsConstants.onboardingTitle2,
      "text": StringsConstants.onboardingSubtitle2,
    },
    {
      "illustration": ImagesConstants.onboarding3,
      "title": StringsConstants.onboardingTitle3,
      "text": StringsConstants.onboardingSubtitle3,
    },
  ];
}
