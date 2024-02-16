import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class CustomCircleDotWidget extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  const CustomCircleDotWidget({
    super.key,
    this.color,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 2.h,
      height: height ?? 2.h,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? ColorsManger.neutralColor50,
      ),
    );
  }
}
