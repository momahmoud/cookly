import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/images_constants.dart';
import '../../../../../core/helper_widgets/custom_circle_dot_widget.dart';
import '../../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../../core/helper_widgets/custom_rating_widget.dart';
import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../data/models/restaurant_model.dart';

class RateDistanceStatusFavoriteWidget extends StatelessWidget {
  const RateDistanceStatusFavoriteWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            CustomRatingWidget(rating: restaurantModel.rate ?? 0.0),
            const CustomCircleDotWidget(),
            CustomText(
              restaurantModel.distance,
              style: getMediumStyle(
                color: ColorsManger.neutralColor800,
                fontSize: 12.sp,
              ),
            ),
            const CustomCircleDotWidget(),
            CustomText(
              restaurantModel.status,
              style: getSemiBoldStyle(
                color: ColorsManger.greenColor400,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        CustomSvgImage(
          imageName: ImagesConstants.favorites,
          color: ColorsManger.primaryColor500,
          height: 30.h,
          width: 30.h,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
