import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class OrLoginWidget extends StatelessWidget {
  const OrLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 2.h,
            color: ColorsManger.neutralColor20,
          ),
        ),
        horizontalSpacing(15.h),
        CustomText(
          StringsConstants.or.tr(context)!.toUpperCase(),
          style: getMediumStyle(
            color: ColorsManger.neutralColor100,
            fontSize: 12.sp,
          ),
        ),
        horizontalSpacing(15.h),
        Expanded(
          child: Container(
            height: 2.h,
            color: ColorsManger.neutralColor20,
          ),
        ),
      ],
    );
  }
}
