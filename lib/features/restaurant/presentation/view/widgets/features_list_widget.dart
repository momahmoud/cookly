import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper_widgets/custom_circle_dot_widget.dart';
import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../data/models/restaurant_model.dart';

class FeaturesListWidget extends StatelessWidget {
  const FeaturesListWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    switch (restaurantModel.features) {
      case []:
        return const SizedBox();

      default:
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: SizedBox(
            height: 30.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: restaurantModel.features.length,
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: ColorsManger.neutralColor20,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomText(
                  restaurantModel.features[index].name,
                  style: getMediumStyle(
                    color: ColorsManger.neutralColor800,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const CustomCircleDotWidget(),
            ),
          ),
        );
    }
  }
}
