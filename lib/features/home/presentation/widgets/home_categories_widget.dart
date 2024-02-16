import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/utils/extensions.dart';
import 'package:foodec/features/home/cubit/home_cubit.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_divider_widget.dart';
import '../../../../core/helper_widgets/section_title_with_see_all_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../cubit/home_state.dart';
import 'home_categories_list_widget.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SectionTitleWithSeeAllWidget(
              sectionTitle: StringsConstants.categories.tr(context)!,
              onSeeAllTap: () {
                // TODO navigate to categories
              },
            ),
          ),
          CustomDividerWidget(
            margin: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, state) =>
                state is CategoriesLoading ||
                state is CategoriesSuccess ||
                state is CategoriesError,
            builder: (context, state) {
              return state.whenOrNull(
                    categoriesLoading: () =>
                        const CircularProgressIndicator.adaptive(),
                    categoriesSuccess: (data) => HomeCategoriesListWidget(
                      categories: data.categories ?? [],
                    ),
                  ) ??
                  const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
