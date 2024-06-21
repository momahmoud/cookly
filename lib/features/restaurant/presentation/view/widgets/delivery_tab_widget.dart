import 'package:cookly/core/helper_widgets/custom_divider_widget.dart';
import 'package:cookly/core/helper_widgets/custom_text_widget.dart';
import 'package:cookly/core/utils/extensions.dart';
import 'package:cookly/features/restaurant/data/models/food_model.dart';
import 'package:cookly/features/restaurant/presentation/view/widgets/horizontal_food_item_widget.dart';
import 'package:cookly/features/restaurant/presentation/view/widgets/vertical_food_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../../../core/utils/spacing.dart';

class DeliveryTabWidget extends StatelessWidget {
  final List<FoodModel> foods;
  const DeliveryTabWidget({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomText(
              StringsConstants.popularItems.tr(context),
              style: getBoldStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 16.sp,
              ),
            ),
          ),
          verticalSpacing(16),
          SizedBox(
            height: 216.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return VerticalFoodItemWidget(
                  food: foods[index],
                );
              },
              separatorBuilder: (context, index) {
                return horizontalSpacing(8);
              },
            ),
          ),
          const CustomDividerWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomText(
              StringsConstants.hotBurgersCombo.tr(context),
              style: getBoldStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 16.sp,
              ),
            ),
          ),
          verticalSpacing(16),
          SizedBox(
            height: 216.h,
            child: ListView.separated(
              itemCount: foods
                  .where((e) => e.categoryName!.contains("Burger Combo"))
                  .length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return HorizontalFoodItemWidget(
                  food: foods
                      .where((e) => e.categoryName!.contains("Burger Combo"))
                      .toList()[index],
                );
              },
              separatorBuilder: (context, index) {
                return horizontalSpacing(8);
              },
            ),
          ),
          const CustomDividerWidget()
        ],
      ),
    );
  }
}
