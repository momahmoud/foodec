import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/spacing.dart';
import 'appointments_and_records_widget.dart';
import 'profile_image_widget.dart';
import 'profile_option_widget.dart';
import 'user_details_widget.dart';

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Transform.translate(
        offset: Offset(0, -60.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              const ProfileImageWidget(),
              verticalSpacing(32.h),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const UserDetailsWidget(),
                    const AppointmentsAndRecordsWidget(),
                    verticalSpacing(24.5.h),
                    const ProfileOptionWidget(
                      title: StringsConstants.personalInformation,
                      imageName: ImagesConstants.personalCard,
                      imageColor: ColorsManger.primaryColor,
                      containerColor: Color(0xffEAF2FF),
                    ),
                    const ProfileOptionWidget(
                      title: StringsConstants.myTestDiagnostic,
                      imageName: ImagesConstants.directBox,
                      imageColor: ColorsManger.secondaryColor,
                      containerColor: Color(0xffE9FAEF),
                    ),
                    const ProfileOptionWidget(
                      title: StringsConstants.payment,
                      imageName: ImagesConstants.wallet,
                      imageColor: ColorsManger.redColor400,
                      containerColor: Color(0xffFFEEEF),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
