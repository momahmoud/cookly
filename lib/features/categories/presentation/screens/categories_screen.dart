import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../cubit/categories_cubit.dart';
import '../widgets/categories_grid_widget.dart';
import '../widgets/categories_loading_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.neutralColor00,
      appBar: CustomAppBar(
        isBorder: true,
        title: CustomText(
          StringsConstants.categories.tr(context)!,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const CategoriesLoadingWidget(),
              success: (categories) => CategoriesGridWidget(
                categories: categories,
              ),
              failure: (failure) => Center(
                child: Text(failure.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
