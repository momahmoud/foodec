import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/categories_model.dart';
import 'category_item_widget.dart';

class HomeCategoriesListWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  const HomeCategoriesListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: categories.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemBuilder: (context, index) {
          return CategoryItemWidget(category: categories[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: .9.h,
          crossAxisSpacing: 4,
          mainAxisSpacing: 2,
        ),
      ),
    );
  }
}
