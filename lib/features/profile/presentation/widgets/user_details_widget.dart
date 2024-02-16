import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          'Mohamed Mahmoud',
          style: getSemiBoldStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(6.h),
        CustomText(
          'mohamed@gmail.com',
          style: getRegularStyle(
            color: ColorsManger.neutralColor40,
            fontSize: 14.sp,
          ),
        ),
        verticalSpacing(24.h),
      ],
    );
  }
}
