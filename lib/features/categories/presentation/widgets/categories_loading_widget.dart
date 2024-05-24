import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_shimmer_loading_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/spacing.dart';

class CategoriesLoadingWidget extends StatelessWidget {
  const CategoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListView.separated(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomShimmerLoadingWidget(
                height: 90.h,
                width: 90.h,
              ),
              verticalSpacing(8),
              CustomShimmerLoadingWidget(height: 20.h, width: 80.w),
            ],
          );
        },
        separatorBuilder: (context, index) => horizontalSpacing(15),
      ),
    );
  }
}
