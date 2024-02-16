import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/home_best_partners_widget.dart';
import 'widgets/home_categories_widget.dart';
import 'widgets/home_filters_tab_bar_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/home_slides_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: HomeHeaderWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: const HomeSlidesWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: ColorsManger.neutralColor20,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: <Widget>[
                  verticalSpacing(12),
                  const HomeCategoriesWidget(),
                  verticalSpacing(12),
                  const HomeBestPartnersWidget(),
                  verticalSpacing(12),
                ],
              ),
            ),
          ),
          SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const HomeFiltersTabBarWidget(),
              ),
              childCount: 1,
              addAutomaticKeepAlives: false,
              semanticIndexOffset: 1,
            ),
          ),
        ],
      ),
    );
  }
}
