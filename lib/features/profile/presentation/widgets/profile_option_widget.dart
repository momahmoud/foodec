import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class ProfileOptionWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String imageName;
  final Color imageColor;
  final Color containerColor;
  const ProfileOptionWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.imageName,
    required this.imageColor,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 16.h),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: ColorsManger.neutralColor01,
          )),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: containerColor,
              ),
              child: CustomSvgImage(
                imageName: imageName,
                height: 24.h,
                width: 24.h,
                color: imageColor,
              ),
            ),
            horizontalSpacing(13.w),
            CustomText(
              title.tr(context),
              style: getRegularStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
