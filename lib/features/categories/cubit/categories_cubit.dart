import 'package:cookly/features/categories/data/repo/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/category_model.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;
  CategoriesCubit(
    this._categoriesRepo,
  ) : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());
    final response = await _categoriesRepo.getCategories();
    response.when(
      success: (data) => emit(CategoriesState.success(data)),
      failure: (failure) =>
          emit(CategoriesState.failure(failure.apiErrorModel.message ?? '')),
    );
  }
}
