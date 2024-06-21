import 'package:cookly/core/constants/images_constants.dart';
import 'package:cookly/core/helper_widgets/custom_circle_dot_widget.dart';
import 'package:cookly/core/helper_widgets/custom_image_widget.dart';
import 'package:cookly/features/restaurant/data/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../../../core/utils/spacing.dart';

class VerticalFoodItemWidget extends StatelessWidget {
  final FoodModel food;
  const VerticalFoodItemWidget({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145.w,
      height: 216.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CustomCachedNetworkImage(
                  imageName: food.image!,
                  width: 145.w,
                  height: 145.h,
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: CustomSvgImage(
                  imageName: ImagesConstants.rateFull,
                  width: 25.w,
                  height: 25.h,
                  color: food.isFavorite!
                      ? ColorsManger.primaryColor500
                      : ColorsManger.neutralColor50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          verticalSpacing(7),
          CustomText(
            food.name!,
            style: getMediumStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 16.sp,
                height: 1.2.sp),
            maxLines: 2,
          ),
          verticalSpacing(2),
          Row(
            children: [
              CustomText(
                '\$ ${food.price}',
                style: getMediumStyle(
                  color: ColorsManger.greenColor400,
                  fontSize: 12.sp,
                ),
              ),
              const CustomCircleDotWidget(),
              CustomText(
                food.categoryName,
                style: getMediumStyle(
                  color: ColorsManger.neutralColor100,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
