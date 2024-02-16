import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/helper_widgets/custom_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodec/features/home/data/models/slides_model.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';

class HomeSlidesWidget extends StatelessWidget {
  const HomeSlidesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, state) =>
          state is SlidesLoading ||
          state is SlidesSuccess ||
          state is SlidesError,
      builder: (context, state) {
        return state.whenOrNull(
              slidesLoading: () => Container(
                height: 148.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: ColorsManger.neutralColor00,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: const CircularProgressIndicator.adaptive(),
              ),
              slidesSuccess: (data) {
                final List<SlideModel> slides = [];
                slides.addAll(data.slides!
                    .where((element) => element.enabled == true)
                    .toList());

                return SizedBox(
                  height: 148.h,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: slides.length == 1 ? 1 : slides.length,
                    itemBuilder: (context, index, realIndex) {
                      final slide = slides[index];
                      return Stack(
                        children: [
                          if (slide.media!.isNotEmpty &&
                              slide.media!.first.url != null)
                            ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(10.r),
                              child: CachedNetworkImage(
                                imageUrl: slide.media!.first.url!
                                    .replaceAll('https', 'http'),
                                fit: HelperMethods.handleImageFit(
                                    slide.imageFit!),
                                height: 200.h,
                                width: double.infinity,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                color: Colors.black.withOpacity(.15),
                                colorBlendMode: BlendMode.darken,
                              ),
                            ),
                          Positioned(
                            top: 10.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: CustomText(
                                slide.text,
                                style: getBoldStyle(
                                  color: ColorsManger.neutralColor00,
                                  fontSize: 18.sp,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      enableInfiniteScroll: slides.length == 1 ? false : true,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      height: 148.h,
                      scrollPhysics: const BouncingScrollPhysics(),
                      viewportFraction: .95,
                      autoPlay: slides.length == 1 ? false : true,
                    ),
                  ),
                );
              },
              slidesError: (error) => Text(error),
            ) ??
            const SizedBox();
      },
    );
  }
}
