import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: CustomSvgImage(imageName: illustration),
            ),
          ),
          verticalSpacing(16),
          CustomText(
            title.tr(context),
            style: getBoldStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 24,
            ),
          ),
          verticalSpacing(8),
          CustomText(
            text.tr(context),
            style: getRegularStyle(
              color: ColorsManger.neutralColor100,
              fontSize: 14,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
