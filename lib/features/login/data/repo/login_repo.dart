import 'package:cookly/features/login/data/models/login_request_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepo {
  final SupabaseClient _supabaseClient;

  LoginRepo(this._supabaseClient);

  Future<AuthResponse> login(LoginRequestBody loginRequestBody) async {
    final response = await _supabaseClient.auth.signInWithPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );

    return response;
  }
}
