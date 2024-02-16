import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import 'custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String? text;
  final Function()? onTap;
  final Widget? icon;
  final Color? textColor;
  final double? fontSize;
  final double? radius;
  final Border? border;
  final bool? isIconsWithText;
  final FontWeight? fontWeight;

  const CustomButtonWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.text,
    this.onTap,
    this.icon,
    this.textColor,
    this.radius = 16,
    this.isIconsWithText = false,
    this.fontSize,
    this.border,
    this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.maxFinite,
        height: height ?? 52.h,
        decoration: BoxDecoration(
          color: color ?? ColorsManger.primaryColor500,
          border: border,
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: isIconsWithText!
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox(),
                    CustomText(
                      text,
                      color: textColor ?? ColorsManger.neutralColor00,
                      textAlign: TextAlign.center,
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: fontWeight ?? FontWeight.bold,
                    ),
                  ],
                ),
              )
            : icon ??
                Center(
                  child: CustomText(
                    text,
                    color: textColor ?? ColorsManger.neutralColor00,
                    textAlign: TextAlign.center,
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: fontWeight ?? FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
