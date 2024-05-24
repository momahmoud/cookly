import 'package:cookly/core/utils/extensions.dart';
import 'package:cookly/features/home/presentation/widgets/home_best_partners_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_divider_widget.dart';
import '../../../../core/helper_widgets/section_title_with_see_all_widget.dart';
import '../../../../core/theme/colors.dart';

class HomeBestPartnersWidget extends StatelessWidget {
  final List<dynamic> partners;
  const HomeBestPartnersWidget({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: ColorsManger.neutralColor00,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SectionTitleWithSeeAllWidget(
              sectionTitle: StringsConstants.bestPartners.tr(context)!,
              onSeeAllTap: () {
                // TODO navigate to partners
              },
            ),
          ),
          CustomDividerWidget(
            margin: EdgeInsets.symmetric(vertical: 15.h),
          ),
          HomeBestPartnersListWidget(partners: partners)
        ],
      ),
    );
  }
}
