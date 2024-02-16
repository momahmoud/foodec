import '../../../../core/constants/strings_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: ColorsManger.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHeaderIcon(ImagesConstants.chevronLeft),
            CustomText(
              StringsConstants.profile.tr(context),
              style: getSemiBoldStyle(
                fontSize: 18.sp,
                color: ColorsManger.neutralColor00,
              ),
            ),
            InkWell(
              onTap: () => context.pushNamed(Routes.settings),
              child: buildHeaderIcon(ImagesConstants.setting),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderIcon(String icon) {
    return Container(
      padding: EdgeInsets.all(8.h),
      width: 40.h,
      height: 40.h,
      child: CustomSvgImage(
        imageName: icon,
        width: 24.w,
        height: 24.h,
        color: ColorsManger.neutralColor00,
      ),
    );
  }
}
