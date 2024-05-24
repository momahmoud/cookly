import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  void getCategories() async {
    emit(state.copyWith(isCategoriesLoading: true));

    final bestResponse = await _homeRepo.getBestPartners();

    bestResponse.when(
      success: (data) {
        emit(state.copyWith(
          bestPartners: data,
          isCategoriesLoading: false,
          categoriesError: '',
          categories: state.categories,
        ));
      },
      failure: (error) => emit(
        state.copyWith(
          isCategoriesLoading: false,
          categoriesError: error.apiErrorModel.message ?? '',
        ),
      ),
    );
  }
}
