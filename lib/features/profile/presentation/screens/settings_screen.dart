import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../widgets/setting_item_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      appBar: CustomAppBar(
        isCenter: true,
        title: CustomText(
          StringsConstants.settings.tr(context),
          style: getSemiBoldStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: <Widget>[
            SettingItemWidget(
              title: StringsConstants.notification,
              imageName: ImagesConstants.notifications,
              onTap: () => context.pushNamed(Routes.notificationsSetting),
            ),
            const SettingItemWidget(
              title: StringsConstants.fAQ,
              imageName: ImagesConstants.messageQuestion,
            ),
            const SettingItemWidget(
              title: StringsConstants.security,
              imageName: ImagesConstants.lock,
            ),
            const SettingItemWidget(
              title: StringsConstants.language,
              imageName: ImagesConstants.languageSquare,
            ),
            const SettingItemWidget(
              title: StringsConstants.logout,
              imageName: ImagesConstants.logout,
              color: ColorsManger.redColor400,
            ),
          ],
        ),
      ),
    );
  }
}
