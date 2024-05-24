import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/colors.dart';

class CustomShimmerLoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? containerColor;

  const CustomShimmerLoadingWidget(
      {super.key,
      this.height,
      this.width,
      this.radius,
      this.baseColor,
      this.highlightColor,
      this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManger.neutralColor30,
      highlightColor: ColorsManger.neutralColor20,
      child: Container(
        height: height ?? 30.h,
        width: width ?? 30.w,
        decoration: BoxDecoration(
          color: containerColor ?? ColorsManger.neutralColor30,
          borderRadius: BorderRadius.circular(radius ?? 100.r),
        ),
      ),
    );
  }
}
