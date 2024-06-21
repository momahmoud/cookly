import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/category_model.dart';
import 'category_item_widget.dart';

class CategoriesGridWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  final Axis? scrollDirection;
  final int? crossAxisCount;
  final double? childAspectRatio;
  const CategoriesGridWidget({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.crossAxisCount = 3,
    this.childAspectRatio = .9,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: scrollDirection!,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount!,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.h,
        childAspectRatio: childAspectRatio!,
      ),
      itemBuilder: (context, index) =>
          CategoryItemWidget(category: categories[index]),
    );
  }
}
