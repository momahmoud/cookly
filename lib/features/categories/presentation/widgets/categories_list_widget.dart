import 'package:cookly/features/categories/cubit/categories_cubit.dart';
import 'package:cookly/features/categories/presentation/widgets/categories_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import 'category_item_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const CategoriesLoadingWidget(),
            failure: (failure) => Center(
              child: Text(failure.toString()),
            ),
            success: (categories) {
              return ListView.separated(
                itemCount: categories.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemBuilder: (context, index) {
                  return CategoryItemWidget(category: categories[index]);
                },
                separatorBuilder: (context, index) => horizontalSpacing(15),
              );
            },
          );
        },
      ),
    );
  }
}
