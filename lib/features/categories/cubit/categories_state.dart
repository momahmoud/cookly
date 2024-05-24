part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.success(List<CategoryModel> categories) =
      _Success;
  const factory CategoriesState.failure(String error) = _Failure;
}
