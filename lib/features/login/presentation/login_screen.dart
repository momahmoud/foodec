import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/images_constants.dart';
import '../../../core/constants/strings_constants.dart';
import '../../../core/helper_widgets/custom_text_widget.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/auth_header_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/or_login_widget.dart';
import 'widgets/social_login_btn_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                verticalSpacing(30.h),
                const AuthHeaderWidget(),
                verticalSpacing(24.h),
                const LoginFormWidget(),
                verticalSpacing(16.h),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.forgotPassword);
                  },
                  child: CustomText(
                    StringsConstants.forgetPassword.tr(context),
                    style: getMediumStyle(
                      color: ColorsManger.redColor400,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                verticalSpacing(12.h),
                const OrLoginWidget(),
                verticalSpacing(12.h),
                SocialLoginBtnWidget(
                  text: StringsConstants.connectWithFacebook.tr(context),
                  imageName: ImagesConstants.facebook,
                ),
                verticalSpacing(8.h),
                SocialLoginBtnWidget(
                  text: StringsConstants.connectWithGoogle.tr(context),
                  imageName: ImagesConstants.google,
                ),
                verticalSpacing(16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
