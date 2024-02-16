import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsListWidget extends StatelessWidget {
  const NotificationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => const SizedBox(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 16.h),
    );
  }
}
