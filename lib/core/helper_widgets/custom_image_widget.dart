import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/colors.dart';

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
      placeholderBuilder: (context) => Shimmer.fromColors(
        baseColor: ColorsManger.neutralColor30,
        highlightColor: ColorsManger.neutralColor20,
        child: Container(
          height: height ?? 30.h,
          width: width ?? 30.w,
          decoration: BoxDecoration(
            color: ColorsManger.neutralColor30,
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
      ),

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
    return FancyShimmerImage(
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      imageUrl: imageName!,
      shimmerBackColor: ColorsManger.neutralColor30,
      shimmerBaseColor: ColorsManger.neutralColor30,
      shimmerHighlightColor: ColorsManger.neutralColor20,
      height: height ?? 30.h,
      width: width ?? 30.w,
      boxFit: fit ?? BoxFit.contain,
      errorWidget: const Icon(Icons.error),
      color: color,
    );
  }
}
