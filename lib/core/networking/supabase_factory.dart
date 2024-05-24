import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  SupabaseFactory._();

  static SupabaseClient? supabaseClient;

  static Future<SupabaseClient> getDio() async {
    if (supabaseClient == null) {
      supabaseClient = SupabaseClient(
        dotenv.env['BASE_URL'] ?? 'https://api.example.com',
        dotenv.env['API_KEY'] ?? '',
        headers: {
          'apikey': dotenv.env['API_KEY'] ?? '',
          'Authorization': 'Bearer ${dotenv.env['API_KEY'] ?? ''}',
          'Content-Type': 'application/json',
        },
      );

      addDioInterceptor();
      return supabaseClient!;
    } else {
      return supabaseClient!;
    }
  }

  static void addDioInterceptor() {
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    );
  }
}
