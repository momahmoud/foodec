import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class SocialLoginBtnWidget extends StatelessWidget {
  final String? text;
  final String imageName;
  const SocialLoginBtnWidget({
    super.key,
    required this.text,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: ColorsManger.lightblueColor,
      ),
      child: Row(
        children: [
          CustomSvgImage(imageName: imageName),
          horizontalSpacing(40.w),
          CustomText(
            text!,
            style: getMediumStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
