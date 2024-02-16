import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../cubit/main_cubit.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: ColorsManger.neutralColor00,
      color: ColorsManger.primaryColor,
      activeColor: ColorsManger.primaryColor,
      top: -25.h,
      elevation: 2,
      shadowColor: ColorsManger.neutralColor00,
      cornerRadius: 0,
      initialActiveIndex: mainCubit.index,
      curveSize: 0,
      height: 30.h,
      items: [
        _buildTabItem(
          icon: ImagesConstants.homeOut,
          activeIcon: ImagesConstants.home,
        ),
        _buildTabItem(
          icon: ImagesConstants.heart,
          activeIcon: ImagesConstants.heartFill,
        ),
        _buildTabItem(
          color: ColorsManger.neutralColor00,
          icon: ImagesConstants.searchNormal,
          activeIcon: ImagesConstants.searchNormal,
          isCenter: true,
        ),
        _buildTabItem(
          icon: ImagesConstants.orders,
          activeIcon: ImagesConstants.orders,
        ),
        _buildTabItem(
          icon: ImagesConstants.user,
          activeIcon: ImagesConstants.user,
        ),
      ],
      onTabNotify: (index) {
        mainCubit.changePage(index);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarBrightness:
              mainCubit.index == 4 ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              mainCubit.index == 4 ? Brightness.light : Brightness.dark,
        ));
        return true;
      },
      onTap: (int index) {
        mainCubit.changePage(index);
      },
    );
  }

  TabItem<dynamic> _buildTabItem({
    required String icon,
    String? title,
    bool isIconBlend = false,
    String? activeIcon,
    Color? color,
    bool? isCenter = false,
  }) {
    return TabItem(
      icon:
          _buildNavIcon(isCenter!, icon, color ?? ColorsManger.neutralColor800),
      title: title,
      isIconBlend: isIconBlend,
      activeIcon: _buildNavIcon(isCenter, activeIcon, color),
    );
  }

  Padding _buildNavIcon(bool isCenter, String? activeIcon, Color? color) {
    return Padding(
      padding: isCenter
          ? EdgeInsets.all(18.h)
          : EdgeInsets.only(top: 2.h, bottom: 1.h),
      child: CustomSvgImage(
        imageName: activeIcon,
        height: 24.h,
        width: 24.h,
        color: color ?? ColorsManger.primaryColor,
      ),
    );
  }
}
