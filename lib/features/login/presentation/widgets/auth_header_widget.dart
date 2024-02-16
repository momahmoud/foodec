import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSvgImage(
          imageName: ImagesConstants.logo,
          height: 160.h,
          width: 160.w,
        ),
        verticalSpacing(30.h),
        CustomText(
          StringsConstants.welcomeBack.tr(context),
          style: getBoldStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 24.sp,
          ),
        ),
        verticalSpacing(2.h),
        CustomText(
          StringsConstants.signInToContinue.tr(context),
          style: getRegularStyle(
            color: ColorsManger.neutralColor100,
            fontSize: 14.sp,
          ),
        ),
        verticalSpacing(5.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              StringsConstants.or.tr(context),
              style: getRegularStyle(
                color: ColorsManger.neutralColor100,
                fontSize: 14.sp,
              ),
            ),
            horizontalSpacing(2.h),
            CustomText(
              StringsConstants.createAnAccount.tr(context),
              style: getRegularStyle(
                color: ColorsManger.redColor400,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
