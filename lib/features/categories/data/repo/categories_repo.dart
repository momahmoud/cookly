import 'package:cookly/features/categories/data/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> fetchCategories();
}

class CategoriesRepoImpl implements CategoriesRepository {
  final SupabaseClient _supabaseClient;
  CategoriesRepoImpl(this._supabaseClient);
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _supabaseClient.from('categories').select();
    return (response as List).map((e) => CategoryModel.fromJson(e)).toList();
  }
}
