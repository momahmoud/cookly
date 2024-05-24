import 'package:cookly/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/categories_cubit.dart';
import 'categories_loading_widget.dart';
import 'category_item_widget.dart';

class CategoriesGridWidget extends StatelessWidget {
  final Axis? scrollDirection;
  final int? crossAxisCount;
  final double? childAspectRatio;
  const CategoriesGridWidget({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.crossAxisCount = 3,
    this.childAspectRatio = .9,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesCubit>()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const CategoriesLoadingWidget(),
            success: (categories) => GridView.builder(
              itemCount: categories.length,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: scrollDirection!,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount!,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: childAspectRatio!,
              ),
              itemBuilder: (context, index) =>
                  CategoryItemWidget(category: categories[index]),
            ),
            failure: (failure) => Center(
              child: Text(failure.toString()),
            ),
          );
        },
      ),
    );
  }
}
