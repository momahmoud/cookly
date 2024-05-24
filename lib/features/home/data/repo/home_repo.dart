import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class HomeRepo {
  final SupabaseClient _supabaseClient;

  HomeRepo(this._supabaseClient);

  Future<ApiResult<dynamic>> getCategories() async {
    try {
      final response = await _supabaseClient.from('categories').select("*");
      print(response);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> getBestPartners() async {
    try {
      final response = await _supabaseClient.from('foods').select();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
