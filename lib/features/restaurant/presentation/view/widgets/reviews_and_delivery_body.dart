import 'package:cookly/features/restaurant/presentation/view/widgets/reviews_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/restaurant_model.dart';
import '../../cubit/restaurant_cubit.dart';
import 'delivery_tab_widget.dart';

class ReviewsAndDeliveryBody extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const ReviewsAndDeliveryBody({
    super.key,
    required this.restaurantModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        final cubit = context.read<RestaurantCubit>();
        switch (cubit.currentTab) {
          case 0:
            return DeliveryTabWidget(foods: restaurantModel.foods ?? []);
          case 1:
            return ReviewsListWidget(reviews: restaurantModel.reviews ?? []);
          default:
            return const SizedBox();
        }
      },
    );
  }
}
