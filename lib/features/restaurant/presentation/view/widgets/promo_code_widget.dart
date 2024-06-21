import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/images_constants.dart';
import '../../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/models/restaurant_model.dart';

class PromoCodeWidget extends StatelessWidget {
  const PromoCodeWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    switch (restaurantModel.discount) {
      case null:
        return const SizedBox();

      default:
        return Container(
          height: 44.h,
          width: double.infinity,
          margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: ColorsManger.neutralColor20,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomSvgImage(
                imageName: ImagesConstants.discount,
                color: ColorsManger.primaryColor500,
                height: 24.h,
                width: 24.h,
                fit: BoxFit.cover,
              ),
              horizontalSpacing(4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Save',
                      style: getRegularStyle(
                        color: ColorsManger.neutralColor800,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: ' \$${restaurantModel.discount} ',
                      style: getBoldStyle(
                        color: ColorsManger.primaryColor500,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: 'with code ',
                      style: getRegularStyle(
                        color: ColorsManger.neutralColor800,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: restaurantModel.promoCode,
                      style: getBoldStyle(
                        color: ColorsManger.greenColor500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }
}
