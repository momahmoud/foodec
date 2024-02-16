import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/theme/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 120.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorsManger.neutralColor00,
          //TODO chandge width to 6
          width: 0.w,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: CustomPngImageWidget(
              imageName: ImagesConstants.personImg,
              height: 120.h,
              width: 120.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5.h,
            right: 0,
            child: Container(
              height: 31.h,
              width: 31.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorsManger.neutralColor00,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManger.neutralColor00,
                  width: 2.w,
                ),
              ),
              child: CustomSvgImage(
                imageName: ImagesConstants.edit,
                height: 16.h,
                width: 16.h,
                color: ColorsManger.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
