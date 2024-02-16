import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_circle_dot_widget.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_rating_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class HomeBestPartnerItemWidget extends StatelessWidget {
  final dynamic partner;
  const HomeBestPartnerItemWidget({super.key, this.partner});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: CustomPngImageWidget(
            imageName: partner['image'],
            height: 116.h,
            width: 205.h,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpacing(12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          width: 205.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: CustomText(
                      partner['name'],
                      style: getSemiBoldStyle(
                        color: ColorsManger.neutralColor800,
                        fontSize: 20.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  horizontalSpacing(2),
                  const CustomSvgImage(
                    imageName: ImagesConstants.shieldCheck,
                    color: ColorsManger.greenColor400,
                  )
                ],
              ),
              verticalSpacing(4),
              Row(
                children: [
                  CustomText(
                    partner['status'],
                    style: getSemiBoldStyle(
                      color: ColorsManger.greenColor400,
                      fontSize: 12.sp,
                    ),
                  ),
                  const CustomCircleDotWidget(),
                  Flexible(
                    child: CustomText(
                      partner['location'],
                      style: getMediumStyle(
                        color: ColorsManger.neutralColor100,
                        fontSize: 12.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              verticalSpacing(12),
              Row(
                children: [
                  CustomRatingWidget(rating: partner['rating']),
                  const CustomCircleDotWidget(),
                  CustomText(
                    partner['distance'],
                    style: getMediumStyle(
                      color: ColorsManger.neutralColor800,
                      fontSize: 12.sp,
                    ),
                  ),
                  const CustomCircleDotWidget(),
                  CustomText(
                    partner['shipping_type'],
                    style: getMediumStyle(
                      color: ColorsManger.neutralColor800,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
