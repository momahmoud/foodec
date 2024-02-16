import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../constants/strings_constants.dart';
import '../theme/colors.dart';
import '../theme/styles_manager.dart';
import 'custom_text_widget.dart';

class SectionTitleWithSeeAllWidget extends StatelessWidget {
  final String sectionTitle;
  final Function()? onSeeAllTap;

  const SectionTitleWithSeeAllWidget({
    super.key,
    required this.sectionTitle,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSeeAllTap,
      child: Row(
        children: [
          CustomText(
            sectionTitle,
            style: getBoldStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 16.sp,
            ),
          ),
          const Spacer(),
          CustomText(
            StringsConstants.seeAll.tr(context),
            style: getSemiBoldStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
