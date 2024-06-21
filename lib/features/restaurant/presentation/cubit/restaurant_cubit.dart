import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/models/restaurant_model.dart';
import '../../data/repo/restaurant_repo.dart';

part 'restaurant_cubit.freezed.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepoImpl _restaurantRepo;

  RestaurantCubit(this._restaurantRepo)
      : super(const RestaurantState.initial());

  int currentTab = 0;

  void fetchRestaurantById(int id) async {
    emit(const RestaurantState.loading());
    try {
      final response = await _restaurantRepo.fetchRestaurantById(id);
      emit(RestaurantState.loaded(restaurants: response));
    } on PostgrestException catch (e) {
      emit(RestaurantState.error(e.details.toString()));
    } catch (e) {
      emit(RestaurantState.error(e.toString()));
    }
  }

  void changeTab(int index) {
    emit(RestaurantState.changeTab(index));
    currentTab = index;
  }
}
