import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/extensions.dart';
import '../../cubit/notifications_setting_cubit/notifications_setting_cubit.dart';
import '../../cubit/notifications_setting_cubit/notifications_setting_state.dart';

class NotificationsSettingScreen extends StatelessWidget {
  const NotificationsSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      appBar: CustomAppBar(
        isCenter: true,
        title: CustomText(
          StringsConstants.notification.tr(context),
          style: getSemiBoldStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: BlocBuilder<NotificationsSettingCubit, NotificationsSettingState>(
        builder: (context, state) {
          final notificationSetting = context.read<NotificationsSettingCubit>();
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NotificationsSettingOptionWidget(
                  title: StringsConstants.notificationFromDocNow.tr(context),
                  isSwitched: state.switchNotification,
                  onChanged: (value) {
                    notificationSetting.switchNotification(value);
                  },
                ),
                NotificationsSettingOptionWidget(
                  title: StringsConstants.sound.tr(context),
                  isSwitched: state.switchSound,
                  onChanged: (value) {
                    notificationSetting.switchSound(value);
                  },
                ),
                NotificationsSettingOptionWidget(
                  title: StringsConstants.vibrate.tr(context),
                  isSwitched: state.switchVibrate,
                  onChanged: (value) {
                    notificationSetting.switchVibrate(value);
                  },
                ),
                NotificationsSettingOptionWidget(
                  title: StringsConstants.appUpdates.tr(context),
                  isSwitched: state.switchAppUpdates,
                  onChanged: (value) {
                    notificationSetting.switchAppUpdates(value);
                  },
                ),
                NotificationsSettingOptionWidget(
                  title: StringsConstants.specialOffers.tr(context),
                  isSwitched: state.switchSpecialOffers,
                  onChanged: (value) {
                    notificationSetting.switchSpecialOffers(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationsSettingOptionWidget extends StatelessWidget {
  final bool isSwitched;
  final Function(bool)? onChanged;
  final String? title;
  const NotificationsSettingOptionWidget({
    super.key,
    required this.isSwitched,
    this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      decoration: const BoxDecoration(
        color: ColorsManger.neutralColor00,
        border: Border(
            bottom: BorderSide(
          width: 1,
          color: ColorsManger.greyColor100,
        )),
      ),
      child: SwitchListTile.adaptive(
        value: isSwitched,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        dense: true,
        isThreeLine: false,
        onChanged: onChanged,
        activeColor: ColorsManger.primaryColor,
        title: CustomText(
          title,
          style: getRegularStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
