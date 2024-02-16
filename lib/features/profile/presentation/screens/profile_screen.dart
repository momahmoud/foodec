import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_options_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManger.primaryColor,
      child: const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ProfileHeaderWidget(),
            ProfileOptionsWidget(),
          ],
        ),
      ),
    );
  }
}
