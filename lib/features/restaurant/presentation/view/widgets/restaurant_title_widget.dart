import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/images_constants.dart';
import '../../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/models/restaurant_model.dart';

class RestaurantTitleWidget extends StatelessWidget {
  const RestaurantTitleWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: CustomText(
            restaurantModel.name,
            style: getSemiBoldStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 20.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        horizontalSpacing(2),
        if (restaurantModel.isVerified!)
          const CustomSvgImage(
            imageName: ImagesConstants.shieldCheck,
            color: ColorsManger.greenColor400,
          )
      ],
    );
  }
}
