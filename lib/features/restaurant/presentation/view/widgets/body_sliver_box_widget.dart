import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../data/models/restaurant_model.dart';
import 'features_list_widget.dart';
import 'location_widget.dart';
import 'promo_code_widget.dart';
import 'rate_distance_status_favorite_widget.dart';
import 'restaurant_description_widget.dart';
import 'restaurant_title_widget.dart';
import 'reviews_and_delivery_body.dart';
import 'reviews_and_delivery_tabs.dart';

class BodySliverBoxWidget extends StatelessWidget {
  const BodySliverBoxWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RestaurantTitleWidget(restaurantModel: restaurantModel),
                verticalSpacing(12),
                RateDistanceStatusFavoriteWidget(
                    restaurantModel: restaurantModel),
                FeaturesListWidget(restaurantModel: restaurantModel),
                LocationWidget(restaurantModel: restaurantModel),
                RestaurantDescriptionWidget(restaurantModel: restaurantModel),
                PromoCodeWidget(restaurantModel: restaurantModel),
              ],
            ),
          ),
          verticalSpacing(20),
          const ReviewsAndDeliveryTabs(),
          ReviewsAndDeliveryBody(restaurantModel: restaurantModel)
        ],
      ),
    );
  }
}
