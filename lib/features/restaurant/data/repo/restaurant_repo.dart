import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/restaurant_model.dart';

class RestaurantRepo {
  final SupabaseClient _supabaseClient;

  RestaurantRepo(this._supabaseClient);
  Future<RestaurantModel> getRestaurant() async {
    try {
      final response =
          await _supabaseClient.from('restaurants').select().single();
      return RestaurantModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
