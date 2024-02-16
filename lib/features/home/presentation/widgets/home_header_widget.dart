import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: <Widget>[
          verticalSpacing(MediaQuery.of(context).viewPadding.top),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CustomSvgImage(
                imageName: ImagesConstants.locationArrow,
                color: ColorsManger.neutralColor50,
              ),
              horizontalSpacing(12),
              Expanded(
                flex: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      StringsConstants.deliveryTo.tr(context),
                      style: getSemiBoldStyle(
                        color: ColorsManger.redColor400,
                        fontSize: 12.sp,
                      ),
                    ),
                    verticalSpacing(6),
                    CustomText(
                      "1024 Prospect Park, Seattle, WA 98101 ",
                      style: getRegularStyle(
                        color: ColorsManger.neutralColor100,
                        fontSize: 14.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 32.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          CustomSvgImage(
                            imageName: ImagesConstants.notifications,
                            height: 24.h,
                            width: 24.w,
                          ),
                          Positioned(
                            right: 4,
                            top: 0,
                            child: Container(
                              width: 6.h,
                              height: 6.h,
                              decoration: const BoxDecoration(
                                color: ColorsManger.secondaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpacing(10),
                    SizedBox(
                      width: 33.w,
                      height: 32.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomLeft,
                        children: [
                          CustomSvgImage(
                            imageName: ImagesConstants.bag2,
                            height: 24.h,
                            width: 24.w,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 16.h,
                              height: 16.h,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(2.h),
                              decoration: const BoxDecoration(
                                color: ColorsManger.secondaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: CustomText(
                                "9",
                                style: getMediumStyle(
                                  color: ColorsManger.neutralColor00,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpacing(15),
          CustomTextFormField(
            fillColor: ColorsManger.greyColor20,
            hint: StringsConstants.search.tr(context),
            prefixIcon: CustomSvgImage(
              imageName: ImagesConstants.searchNormal,
              color: ColorsManger.greyColor60,
              height: 20.h,
              width: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
