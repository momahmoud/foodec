import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/notifications_header_widget.dart';
import 'widgets/notifications_list_widget.dart';
import 'widgets/notifications_section_title_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: <Widget>[
              const NotificationHeaderWidget(),
              verticalSpacing(20.h),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      NotificationsSectionTitleWidget(title: 'Today'),
                      NotificationsSectionTitleWidget(
                        title: 'Yesterday',
                        isReadAllButton: false,
                      ),
                      NotificationsListWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
