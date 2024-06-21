import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/restaurant_model.dart';

abstract class RestaurantsRepository {
  Future<List<RestaurantModel>> fetchRestaurants();
  Future<RestaurantModel> fetchRestaurantById(int id);
}

class RestaurantRepoImpl implements RestaurantsRepository {
  final SupabaseClient _supabaseClient;
  RestaurantRepoImpl(this._supabaseClient);
  @override
  Future<List<RestaurantModel>> fetchRestaurants() async {
    final response = await _supabaseClient
        .from('restaurants')
        .select('*, rest_cat(*), foods(*), reviews(*)');
    print(response);
    return (response as List).map((e) => RestaurantModel.fromJson(e)).toList();
  }

  @override
  Future<RestaurantModel> fetchRestaurantById(int id) async {
    final response = await _supabaseClient
        .from('restaurants')
        .select('*,  foods(*)')
        .eq('id', id);
    return RestaurantModel.fromJson(response.first);
  }
}
