import 'package:flutter/foundation.dart';

class HomeState {
  final List<dynamic>? categories;
  final List<dynamic>? bestPartners;
  final bool? isCategoriesLoading;
  final String? categoriesError;

  HomeState({
    this.categories,
    this.isCategoriesLoading,
    this.categoriesError,
    this.bestPartners,
  });

  factory HomeState.initial() {
    return HomeState(
      categories: [],
      bestPartners: [],
      isCategoriesLoading: false,
      categoriesError: '',
    );
  }

  HomeState copyWith({
    List<dynamic>? categories,
    List<dynamic>? bestPartners,
    bool? isCategoriesLoading,
    String? categoriesError,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
      categoriesError: categoriesError ?? this.categoriesError,
      bestPartners: bestPartners ?? this.bestPartners,
    );
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return listEquals(other.categories, categories) &&
        other.isCategoriesLoading == isCategoriesLoading &&
        other.categoriesError == categoriesError &&
        other.bestPartners == bestPartners;
  }

  @override
  int get hashCode {
    return categories.hashCode ^
        isCategoriesLoading.hashCode ^
        bestPartners.hashCode ^
        categoriesError.hashCode;
  }
}
