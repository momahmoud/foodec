import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class NotificationsSectionTitleWidget extends StatelessWidget {
  final String title;
  final bool? isReadAllButton;
  const NotificationsSectionTitleWidget({
    super.key,
    required this.title,
    this.isReadAllButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomText(
            title,
            style: getMediumStyle(
              color: ColorsManger.neutralColor30,
              fontSize: 12.sp,
            ),
          ),
          if (isReadAllButton == true)
            TextButton(
              style: TextButton.styleFrom(
                elevation: 0,
                foregroundColor: ColorsManger.primaryColor,
              ),
              onPressed: () {},
              child: CustomText(
                'Mark all as read',
                style: getRegularStyle(
                  color: ColorsManger.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
            )
        ],
      ),
    );
  }
}
