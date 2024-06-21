import 'package:cookly/core/constants/images_constants.dart';
import 'package:cookly/core/helper_widgets/custom_image_widget.dart';
import 'package:cookly/core/utils/methods.dart';
import 'package:cookly/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../data/models/review_model.dart';

class ReviewItemWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.h,
                width: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorsManger.lightblueColor,
                ),
                child: CustomText(
                  getInitials(review.username![0]),
                  style: getBoldStyle(
                    color: generateColor(review.username!),
                    fontSize: 16.sp,
                  ),
                ),
              ),
              horizontalSpacing(15),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            review.username,
                            style: getMediumStyle(
                              color: ColorsManger.neutralColor800,
                              fontSize: 14.sp,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        horizontalSpacing(8),
                        CustomText(
                          formatDateAndTime(review.time!),
                          style: getMediumStyle(
                            color: ColorsManger.neutralColor100,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(2),
                    SizedBox(
                      width: double.infinity,
                      height: 16.h,
                      child: ListView.separated(
                        itemCount: 5,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CustomSvgImage(
                          imageName: ImagesConstants.rateFull,
                          height: 16.h,
                          width: 16.w,
                          color: index < review.rating!.toInt()
                              ? ColorsManger.primaryColor500
                              : ColorsManger.neutralColor100,
                        ),
                        separatorBuilder: (context, index) =>
                            horizontalSpacing(1),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          verticalSpacing(8),
          CustomText(
            review.description!,
            style: getRegularStyle(
              color: ColorsManger.neutralColor800,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
