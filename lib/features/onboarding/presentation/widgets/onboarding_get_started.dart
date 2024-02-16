import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/shared_prefs.dart';

class OnBoardingGetStarted extends StatelessWidget {
  const OnBoardingGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: CustomButtonWidget(
        onTap: () {
          SharedPreferencesService.saveData(AppConstants.onboardingSeen, true);
          context.pushNamed(Routes.login);
        },
        color: ColorsManger.redColor400,
        height: 44.h,
        radius: 16.r,
        textColor: ColorsManger.neutralColor00,
        fontSize: 14.sp,
        text: StringsConstants.onboardingGetStarted,
      ),
    );
  }
}
