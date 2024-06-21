import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/spacing.dart';
import '../../cubit/restaurant_cubit.dart';

class ReviewsAndDeliveryTabs extends StatelessWidget {
  const ReviewsAndDeliveryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      buildWhen: (previous, current) => current is ChangeTab,
      builder: (context, state) {
        final cubit = context.read<RestaurantCubit>();
        return Container(
          height: 50.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
            color: ColorsManger.neutralColor00,
            border: Border(
              top: BorderSide(color: ColorsManger.neutralColor20),
              bottom: BorderSide(color: ColorsManger.neutralColor20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Row(
                  children: [
                    _buildTab(index: 0, context: context, cubit: cubit),
                    horizontalSpacing(20.h),
                    _buildTab(index: 1, context: context, cubit: cubit),
                  ],
                ),
              ),
              BlocBuilder<RestaurantCubit, RestaurantState>(
                builder: (context, state) {
                  return Row(
                    children: <Widget>[
                      _buildDivider(cubit.currentTab, 0),
                      horizontalSpacing(20.h),
                      _buildDivider(cubit.currentTab, 1),
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab({
    required int index,
    required BuildContext context,
    required RestaurantCubit cubit,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          cubit.changeTab(index);
        },
        child: CustomText(
          index == 0
              ? StringsConstants.delivery.tr(context)
              : StringsConstants.reviews.tr(context),
          style: getMediumStyle(
            color: cubit.currentTab == index
                ? ColorsManger.primaryColor500
                : ColorsManger.neutralColor800,
            fontSize: 13.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDivider(int currentTab, int index) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: currentTab == index ? 2.h : 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: currentTab == index
              ? ColorsManger.primaryColor500
              : ColorsManger.neutralColor20,
        ),
      ),
    );
  }
}
