import 'package:cookly/core/helper_widgets/custom_shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utils/spacing.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 8),
          decoration: BoxDecoration(
            color: ColorsManger.neutralColor00,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            children: [
              verticalSpacing(MediaQuery.of(context).viewPadding.top),
              CustomShimmerLoadingWidget(
                width: double.infinity,
                height: 40.h,
                radius: 20.r,
              ),
              verticalSpacing(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomShimmerLoadingWidget(
                          width: double.infinity,
                          height: 10.h,
                          radius: 20.r,
                        ),
                        verticalSpacing(10),
                        CustomShimmerLoadingWidget(
                          width: double.infinity,
                          height: 10.h,
                          radius: 20.r,
                        ),
                      ],
                    ),
                  ),
                  horizontalSpacing(20),
                  CustomShimmerLoadingWidget(
                    width: 120,
                    height: 40.h,
                    radius: 20.r,
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpacing(15),
      ],
    );
  }
}
