import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../constants/images_constants.dart';
import '../theme/colors.dart';
import 'custom_back_button_widget.dart';
import 'custom_image_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? title;
  final bool? isTitle;
  final double elevation;
  final Color shadowColor;
  final Color? leadingColor;
  final bool? isLeading;
  final bool? isHome;
  final bool? isCenter;
  final Function()? onTap;
  final Widget? actionIcon;
  final Color? color;
  final bool? isBorder;

  const CustomAppBar({
    this.title,
    Key? key,
    this.isTitle = true,
    this.elevation = 0.0,
    this.shadowColor = ColorsManger.neutralColor00,
    this.isLeading = true,
    this.isCenter = false,
    this.isHome = false,
    this.onTap,
    this.actionIcon,
    this.color,
    this.leadingColor,
    this.isBorder = true,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarOpacity: 1,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorsManger.neutralColor00,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      toolbarHeight: 50.h,
      backgroundColor: color ?? ColorsManger.neutralColor00,
      elevation: elevation,
      shadowColor: shadowColor,
      centerTitle: isCenter,
      titleSpacing: 6.w,
      leadingWidth: 60.w,
      actions: [isHome! ? actionIcon ?? const SizedBox() : const SizedBox()],
      title: isTitle!
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: title ??
                  Row(
                    children: [
                      CustomSvgImage(
                        imageName: ImagesConstants.docLogo,
                        width: 45.h,
                        height: 45.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
            )
          : title,
      leading: isLeading!
          ? Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CustomBackButtonWidget(
                onTap: onTap ?? () => context.pop(),
                isBorder: isBorder,
              ),
            )
          : null,
    );
  }
}
