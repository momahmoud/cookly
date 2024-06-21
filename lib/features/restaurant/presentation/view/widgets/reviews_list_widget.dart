import 'package:cookly/core/helper_widgets/custom_divider_widget.dart';
import 'package:cookly/features/restaurant/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'review_item_widget.dart';

class ReviewsListWidget extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewsListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reviews.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ReviewItemWidget(review: reviews[index]);
      },
      separatorBuilder: (context, index) {
        return const CustomDividerWidget();
      },
    );
  }
}
