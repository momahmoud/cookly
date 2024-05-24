import 'package:cookly/features/categories/data/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class CategoriesRepo {
  final SupabaseClient _supabaseClient;

  CategoriesRepo(this._supabaseClient);

  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final response = await _supabaseClient.from('categories').select("*");
      print(response);
      return ApiResult.success(
        (response as List).map((e) => CategoryModel.fromJson(e)).toList(),
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
