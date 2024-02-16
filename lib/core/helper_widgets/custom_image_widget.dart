import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPngImageWidget extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  const CustomPngImageWidget(
      {Key? key, this.imageName, this.height, this.width, this.color, this.fit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }
}

class CustomGifImageWidget extends StatelessWidget {
  final String? imageName;
  final double? height;

  const CustomGifImageWidget({Key? key, this.imageName, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.gif',
      height: height ?? 30.h,
    );
  }
}

class CustomSvgImage extends StatelessWidget {
  final String? imageName;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomSvgImage(
      {super.key,
      this.imageName,
      this.color,
      this.height,
      this.width,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$imageName.svg',
      color: color,
      height: height ?? 30,
      width: width ?? 30,
      fit: fit ?? BoxFit.contain,
    );
  }
}

class CustomSvgImageNetwork extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const CustomSvgImageNetwork(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.color,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageName!,
      color: color,
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.contain,

      // placeholderBuilder: (context) => const LoadingWidget(),
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const CustomCachedNetworkImage(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.color,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageName!,
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.contain,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      color: color,
    );
  }
}
