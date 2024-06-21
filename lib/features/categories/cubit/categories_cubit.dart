import 'package:cookly/features/categories/data/repo/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/category_model.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepoImpl _categoriesRepo;
  CategoriesCubit(
    this._categoriesRepo,
  ) : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());
    final response = await _categoriesRepo.fetchCategories();
    try {
      emit(CategoriesState.success(response));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }
}
