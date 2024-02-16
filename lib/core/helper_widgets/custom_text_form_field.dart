import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text_widget.dart';
import '../utils/extensions.dart';
import '../utils/spacing.dart';

import '../theme/colors.dart';
import '../theme/styles_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool? isObscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure,
    this.fillColor,
    this.contentPadding,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          CustomText(
            label!.tr(context),
            style: getMediumStyle(
              color: ColorsManger.neutralColor100,
              fontSize: 14.sp,
            ),
          ),
        if (label != null) verticalSpacing(8),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          cursorColor: ColorsManger.neutralColor100,
          cursorHeight: 12.h,
          cursorWidth: 2.w,
          cursorRadius: Radius.circular(4.r),
          style: getRegularStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 14.sp,
          ),
          keyboardType: textInputType ?? TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: isObscure ?? false,
          obscuringCharacter: '*',
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? ColorsManger.neutralColor01,
            isDense: true,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: prefixIcon,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: suffixIcon,
            ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 50, maxWidth: 50),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 50, maxWidth: 50),
            border: borderStyle(ColorsManger.neutralColor00),
            enabledBorder: borderStyle(ColorsManger.neutralColor00),
            focusedBorder: borderStyle(ColorsManger.neutralColor00),
            errorBorder: borderStyle(ColorsManger.redColor400),
            focusedErrorBorder: borderStyle(ColorsManger.redColor400),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            errorStyle: getRegularStyle(
              color: ColorsManger.redColor400,
              fontSize: 12.sp,
            ),
            hintText: hint ?? "",
            hintStyle: getRegularStyle(
              color: ColorsManger.greyColor60,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder borderStyle(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
}
