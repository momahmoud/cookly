import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../categories/data/models/category_model.dart';
import '../../categories/data/repo/categories_repo.dart';
import '../../restaurant/data/models/food_model.dart';
import '../../restaurant/data/models/restaurant_model.dart';
import '../../restaurant/data/repo/restaurant_repo.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // final FoodRepository foodRepository;
  final CategoriesRepoImpl _categoriesRepo;
  final RestaurantRepoImpl _restaurantRepo;
  HomeCubit(
    this._categoriesRepo,
    this._restaurantRepo,
  ) : super(const HomeState.initial());

  Future<void> fetchHomePageData() async {
    emit(const HomeState.loading());
    try {
      // final foods = await foodRepository.fetchFoods();
      final categories = await _categoriesRepo.fetchCategories();
      final restaurants = await _restaurantRepo.fetchRestaurants();

      emit(HomeState.loaded(
        foods: [],
        categories: categories,
        restaurants: restaurants,
      ));
    } on PostgrestException catch (e) {
      emit(HomeState.error(e.details.toString()));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
