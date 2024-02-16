import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodec/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManger.neutralColor20,
      highlightColor: ColorsManger.neutralColor20,
      child: Container(
        height: 200.h,
        color: ColorsManger.neutralColor01,
      ),
    );
  }
}
