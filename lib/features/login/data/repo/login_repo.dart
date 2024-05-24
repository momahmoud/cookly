import 'package:cookly/features/login/data/models/login_request_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class LoginRepo {
  final SupabaseClient _supabaseClient;

  LoginRepo(this._supabaseClient);

  Future<ApiResult<AuthResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: loginRequestBody.email,
        password: loginRequestBody.password,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
