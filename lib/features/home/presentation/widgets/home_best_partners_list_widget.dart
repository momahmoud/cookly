import 'package:cookly/core/routing/routes.dart';
import 'package:cookly/core/utils/extensions.dart';
import 'package:cookly/features/restaurant/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import 'home_best_partner_item_widget.dart';

class HomeBestPartnersListWidget extends StatelessWidget {
  final List<RestaurantModel> partners;
  const HomeBestPartnersListWidget({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: partners.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(Routes.restaurantScreen,
                  arguments: partners[index]);
            },
            child: HomeBestPartnerItemWidget(partner: partners[index]),
          );
        },
        separatorBuilder: (context, index) => horizontalSpacing(15),
      ),
    );
  }
}
