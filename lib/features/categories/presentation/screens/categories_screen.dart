import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../widgets/categories_grid_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBorder: true,
        title: CustomText(
          StringsConstants.categories.tr(context)!,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: const CategoriesGridWidget(),
      ),
    );
  }
}
