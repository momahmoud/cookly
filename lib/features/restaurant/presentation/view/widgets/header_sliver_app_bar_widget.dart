import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper_widgets/custom_back_button_widget.dart';
import '../../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../data/models/restaurant_model.dart';

class HeaderSliverAppBarWidget extends StatelessWidget {
  const HeaderSliverAppBarWidget({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      pinned: true,
      elevation: 0,
      forceMaterialTransparency: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 5, top: 8),
        child: CustomBackButtonWidget(isBorder: false),
      ),
      expandedHeight: 240.h,
      backgroundColor: ColorsManger.neutralColor00,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: 0.h),
        expandedTitleScale: 1.1,
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          children: [
            CustomCachedNetworkImage(
              imageName: restaurantModel.image,
              height: 240.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 0, color: ColorsManger.neutralColor00),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsManger.neutralColor00.withOpacity(0.0001),
                    ColorsManger.neutralColor00.withOpacity(0.001),
                    ColorsManger.neutralColor00.withOpacity(0.01),
                    ColorsManger.neutralColor00.withOpacity(0.1),
                    ColorsManger.neutralColor00,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
