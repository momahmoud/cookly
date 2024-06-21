import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../data/models/restaurant_model.dart';

class RestaurantDescriptionWidget extends StatelessWidget {
  const RestaurantDescriptionWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    switch (restaurantModel.description) {
      case null:
        return const SizedBox();

      default:
        return Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: CustomText(
            restaurantModel.description ?? '',
            style: getRegularStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 16.sp,
            ),
          ),
        );
    }
  }
}
