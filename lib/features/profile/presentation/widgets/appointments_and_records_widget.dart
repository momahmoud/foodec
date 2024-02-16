import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class AppointmentsAndRecordsWidget extends StatelessWidget {
  const AppointmentsAndRecordsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorsManger.neutralColor01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: CustomText(
              StringsConstants.myAppointment.tr(context),
              style: getRegularStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 12.sp,
              ),
            ),
          ),
          Container(
            width: 1.3.w,
            height: 30.h,
            color: ColorsManger.neutralColor200,
          ),
          Flexible(
            child: CustomText(
              StringsConstants.medicalRecords.tr(context),
              style: getRegularStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
