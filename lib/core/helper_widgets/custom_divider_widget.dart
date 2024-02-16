import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class CustomDividerWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  const CustomDividerWidget({
    super.key,
    this.color,
    this.height,
    this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1,
      margin: margin ?? EdgeInsets.symmetric(vertical: 20.h),
      width: width ?? double.infinity,
      color: color ?? ColorsManger.neutralColor20,
    );
  }
}
