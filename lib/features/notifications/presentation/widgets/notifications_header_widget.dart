import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_back_button_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class NotificationHeaderWidget extends StatelessWidget {
  const NotificationHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CustomBackButtonWidget(),
        CustomText(
          StringsConstants.notification.tr(context),
          style: getSemiBoldStyle(
            color: ColorsManger.neutralColor200,
            fontSize: 18.sp,
          ),
        ),
        Container(
          width: 51.w,
          height: 27.h,
          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: ColorsManger.primaryColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: CustomText(
            '2 NEW',
            style: getMediumStyle(
              color: ColorsManger.neutralColor00,
              fontSize: 8.sp,
            ),
          ),
        ),
      ],
    );
  }
}
