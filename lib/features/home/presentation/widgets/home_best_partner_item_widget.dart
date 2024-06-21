import 'package:cookly/core/constants/images_constants.dart';
import 'package:cookly/core/helper_widgets/custom_rating_widget.dart';
import 'package:cookly/features/restaurant/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_circle_dot_widget.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class HomeBestPartnerItemWidget extends StatelessWidget {
  final RestaurantModel partner;
  const HomeBestPartnerItemWidget({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: CustomCachedNetworkImage(
            imageName: partner.image,
            height: 116.h,
            width: 205.h,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpacing(12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          width: 205.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: CustomText(
                      partner.name,
                      style: getSemiBoldStyle(
                        color: ColorsManger.neutralColor800,
                        fontSize: 20.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  horizontalSpacing(2),
                  if (partner.isVerified!)
                    const CustomSvgImage(
                      imageName: ImagesConstants.shieldCheck,
                      color: ColorsManger.greenColor400,
                    )
                ],
              ),
              verticalSpacing(4),
              Row(
                children: [
                  CustomText(
                    partner.status,
                    style: getSemiBoldStyle(
                      color: ColorsManger.greenColor400,
                      fontSize: 12.sp,
                    ),
                  ),
                  const CustomCircleDotWidget(),
                  Flexible(
                    child: CustomText(
                      partner.location,
                      style: getMediumStyle(
                        color: ColorsManger.neutralColor100,
                        fontSize: 12.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              verticalSpacing(12),
              Row(
                children: [
                  CustomRatingWidget(rating: partner.rate ?? 0.0),
                  const CustomCircleDotWidget(),
                  CustomText(
                    partner.distance,
                    style: getMediumStyle(
                      color: ColorsManger.neutralColor800,
                      fontSize: 12.sp,
                    ),
                  ),
                  if (partner.features.isNotEmpty)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomCircleDotWidget(),
                        CustomText(
                          partner.features[0].name,
                          style: getMediumStyle(
                            color: ColorsManger.neutralColor800,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
