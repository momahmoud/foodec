import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/images_constants.dart';
import '../theme/colors.dart';
import '../theme/styles_manager.dart';
import '../utils/spacing.dart';
import 'custom_image_widget.dart';
import 'custom_text_widget.dart';

class CustomDistanceWidget extends StatelessWidget {
  final String distance;
  final double? radius;
  final Color? containerColor;
  final Color? textAndStarColor;

  const CustomDistanceWidget({
    super.key,
    required this.distance,
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
      child: Row(
        children: <Widget>[
          CustomSvgImage(
            imageName: ImagesConstants.locationMap,
            color: textAndStarColor ?? ColorsManger.neutralColor00,
            width: 16.w,
            height: 16.w,
          ),
          horizontalSpacing(2),
          Flexible(
            child: CustomText(
              distance,
              style: getSemiBoldStyle(
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
