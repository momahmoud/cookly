import 'package:cookly/features/categories/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          width: 100.h,
          padding: EdgeInsets.all(26.w),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFAE5),
            shape: BoxShape.circle,
          ),
          child: category.image!.endsWith('.svg')
              ? CustomSvgImageNetwork(
                  imageName: category.image,
                  height: 100.h,
                  width: 100.h,
                )
              : CustomCachedNetworkImage(
                  imageName: category.image,
                  height: 116.h,
                  width: 205.h,
                  fit: BoxFit.cover,
                ),
        ),
        verticalSpacing(8),
        CustomText(
          category.name,
          style: getSemiBoldStyle(
            color: ColorsManger.neutralColor800,
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }
}
