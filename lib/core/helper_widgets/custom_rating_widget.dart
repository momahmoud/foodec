import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/images_constants.dart';
import '../theme/colors.dart';
import '../theme/styles_manager.dart';
import '../utils/spacing.dart';
import 'custom_image_widget.dart';
import 'custom_text_widget.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  final double? radius;
  final Color? containerColor;
  final Color? textAndStarColor;

  const CustomRatingWidget({
    super.key,
    required this.rating,
    this.containerColor,
    this.radius = 900,
    this.textAndStarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 50.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: containerColor ?? ColorsManger.redColor400,
        borderRadius: BorderRadius.circular(radius!.r),
      ),
      child: Row(
        children: <Widget>[
          CustomSvgImage(
            imageName: ImagesConstants.star,
            color: textAndStarColor ?? ColorsManger.neutralColor00,
            width: 16.w,
            height: 16.w,
          ),
          horizontalSpacing(2),
          Flexible(
            child: CustomText(
              rating.toString(),
              style: getMediumStyle(
                color: textAndStarColor ?? ColorsManger.neutralColor00,
                fontSize: 12.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
