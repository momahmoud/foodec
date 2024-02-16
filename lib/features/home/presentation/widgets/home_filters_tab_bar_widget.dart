import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_circle_dot_widget.dart';
import '../../../../core/helper_widgets/custom_distance_widget.dart';
import '../../../../core/helper_widgets/custom_divider_widget.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_rating_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../dummy_data.dart';

class HomeFiltersTabBarWidget extends StatefulWidget {
  const HomeFiltersTabBarWidget({super.key});

  @override
  State<HomeFiltersTabBarWidget> createState() =>
      _HomeFiltersTabBarWidgetState();
}

class _HomeFiltersTabBarWidgetState extends State<HomeFiltersTabBarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  String selectedOption = filtersOptions[0];
  List filteredFoods = filtersFood.where((food) {
    return food['filters'].contains(filtersOptions[0]);
  }).toList();

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: filtersOptions.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: TabBar(
                labelColor: ColorsManger.neutralColor800,
                controller: tabController,
                indicatorColor: ColorsManger.redColor400,
                onTap: (value) {
                  setState(() {
                    selectedOption = filtersOptions[value];
                    filteredFoods = filtersFood.where((food) {
                      return food['filters'].contains(filtersOptions[value]);
                    }).toList();
                  });
                },
                automaticIndicatorColorAdjustment: true,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
                indicatorWeight: 2.h,
                labelPadding:
                    EdgeInsets.only(bottom: 5.h, left: 20.w, right: 20.w),
                isScrollable: true,
                unselectedLabelColor: ColorsManger.neutralColor800,
                labelStyle: getSemiBoldStyle(
                  color: ColorsManger.neutralColor800,
                  fontSize: 14.sp,
                ),
                tabs: filtersOptions
                    .map((option) => Tab(
                          child: CustomText(
                            option,
                            style: getSemiBoldStyle(
                              color: option == selectedOption
                                  ? ColorsManger.redColor400
                                  : ColorsManger.neutralColor400,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))
                    .toList()),
          ),
          CustomDividerWidget(margin: EdgeInsets.only(bottom: 20.h)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                viewportFraction: 1,
                controller: tabController,
                children: filtersOptions.map((option) {
                  if (filteredFoods.isEmpty) {
                    return Center(
                      child: CustomText(
                        "No results found",
                        style: getMediumStyle(
                          color: ColorsManger.neutralColor800,
                          fontSize: 12.sp,
                        ),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: filteredFoods.map((food) {
                        if (!food['filters'].contains(option)) {
                          return const SizedBox();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: CustomPngImageWidget(
                                imageName: food["image"],
                                height: 180.h,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            verticalSpacing(15),
                            Row(
                              children: [
                                Flexible(
                                  child: CustomText(
                                    food['name'],
                                    style: getSemiBoldStyle(
                                      color: ColorsManger.neutralColor800,
                                      fontSize: 20.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                horizontalSpacing(2),
                                const CustomSvgImage(
                                  imageName: ImagesConstants.shieldCheck,
                                  color: ColorsManger.greenColor400,
                                )
                              ],
                            ),
                            verticalSpacing(4),
                            SizedBox(
                              height: 20.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    food['status'],
                                    style: getMediumStyle(
                                      color: ColorsManger.greenColor400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const Center(child: CustomCircleDotWidget()),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: food['meals'].length,
                                    itemBuilder: (context, index) {
                                      return CustomText(
                                        food['meals'][index],
                                        style: getMediumStyle(
                                          color: ColorsManger.neutralColor100,
                                          fontSize: 12.sp,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const CustomCircleDotWidget(),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacing(4),
                            Row(
                              children: [
                                CustomRatingWidget(
                                  rating: food['rating'],
                                  radius: 8,
                                ),
                                const CustomDistanceWidget(distance: "9"),
                              ],
                            ),
                            const CustomDividerWidget(),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
