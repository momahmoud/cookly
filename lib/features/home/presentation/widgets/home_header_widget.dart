import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: <Widget>[
          verticalSpacing(MediaQuery.of(context).viewPadding.top),
          CustomTextFormField(
            fillColor: ColorsManger.neutralColor20,
            hint: StringsConstants.search.tr(context),
            prefixIcon: const CustomSvgImage(
              imageName: ImagesConstants.locationMap,
              color: ColorsManger.neutralColor50,
            ),
          ),
          verticalSpacing(15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CustomSvgImage(
                imageName: ImagesConstants.locationArrow,
                color: ColorsManger.neutralColor50,
              ),
              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      StringsConstants.deliveryTo.tr(context),
                      style: getSemiBoldStyle(
                        color: ColorsManger.redColor400,
                        fontSize: 12.sp,
                      ),
                    ),
                    verticalSpacing(6),
                    CustomText(
                      "1024 Prospect Park, Seattle, WA 98101 ",
                      style: getRegularStyle(
                        color: ColorsManger.neutralColor100,
                        fontSize: 14.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              horizontalSpacing(60),
              Container(
                height: 40.h,
                width: 82.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: ColorsManger.neutralColor20,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CustomSvgImage(
                      imageName: ImagesConstants.filter,
                      color: ColorsManger.neutralColor50,
                    ),
                    horizontalSpacing(4),
                    CustomText(
                      StringsConstants.filter.tr(context),
                      style: getSemiBoldStyle(
                        color: ColorsManger.neutralColor800,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpacing(10),
          Container(
            height: 5.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: ColorsManger.neutralColor20,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ],
      ),
    );
  }
}
