import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../data/models/restaurant_model.dart';
import 'widgets/body_sliver_box_widget.dart';
import 'widgets/header_sliver_app_bar_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const RestaurantScreen({super.key, required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      extendBodyBehindAppBar: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          HeaderSliverAppBarWidget(restaurantModel: restaurantModel),
          BodySliverBoxWidget(restaurantModel: restaurantModel),
        ],
      ),
    );
  }
}
