import 'package:cookly/core/routing/routes.dart';
import 'package:cookly/core/utils/extensions.dart';
import 'package:cookly/features/categories/presentation/widgets/categories_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_divider_widget.dart';
import '../../../../core/helper_widgets/section_title_with_see_all_widget.dart';
import '../../../../core/theme/colors.dart';

class HomeCategoriesWidget extends StatelessWidget {
  final List<dynamic> categories;
  const HomeCategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
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
              sectionTitle: StringsConstants.categories.tr(context)!,
              onSeeAllTap: () {
                context.pushNamed(Routes.categoriesScreen);
              },
            ),
          ),
          CustomDividerWidget(
            margin: EdgeInsets.symmetric(vertical: 15.h),
          ),
          const Expanded(
            child: CategoriesGridWidget(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              childAspectRatio: 1.1,
            ),
          )
        ],
      ),
    );
  }
}
