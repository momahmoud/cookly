import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/images_constants.dart';
import '../../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../data/models/restaurant_model.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgImage(
          imageName: ImagesConstants.locationMap,
          color: ColorsManger.primaryColor500,
          height: 30.h,
          width: 30.h,
          fit: BoxFit.cover,
        ),
        Flexible(
          child: CustomText(
            restaurantModel.location ?? '',
            style: getMediumStyle(
              color: ColorsManger.neutralColor100,
              fontSize: 12.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
