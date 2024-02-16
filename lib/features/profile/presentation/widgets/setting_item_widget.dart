import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class SettingItemWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String imageName;
  final Color? color;
  const SettingItemWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.imageName,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: ColorsManger.neutralColor400,
          )),
        ),
        child: Row(
          children: <Widget>[
            CustomSvgImage(
              imageName: imageName,
              height: 24.h,
              width: 24.h,
              color: color ?? ColorsManger.neutralColor800,
            ),
            horizontalSpacing(12.w),
            CustomText(
              title.tr(context),
              style: getRegularStyle(
                color: color ?? ColorsManger.neutralColor400,
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            CustomSvgImage(
              imageName: ImagesConstants.chevronRight,
              height: 18.h,
              width: 18.h,
              color: ColorsManger.neutralColor400,
            ),
          ],
        ),
      ),
    );
  }
}
