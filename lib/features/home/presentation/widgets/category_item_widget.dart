import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/categories_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.h,
          width: 65.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomCachedNetworkImage(
              imageName: category.media!.first.url ?? '',
              // fit: BoxFit.cover,
            ),
          ),
        ),
        verticalSpacing(3),
        Flexible(
          child: CustomText(
            category.name,
            style: getSemiBoldStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 10.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
