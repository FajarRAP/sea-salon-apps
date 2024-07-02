import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSources {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(
      String email, String name, String phone, String password);
  Future<void> logout();
}

class AuthRemoteDataSourcesImpl extends AuthRemoteDataSources {
  final SupabaseClient supabase;

  AuthRemoteDataSourcesImpl(this.supabase);

  @override
  Future<AuthResponse> login(String email, String password) async =>
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

  @override
  Future<AuthResponse> register(
          String email, String name, String phone, String password) async =>
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'phone': phone,
          'role': 1,
        },
      );

  @override
  Future<void> logout() async => await supabase.auth.signOut();
}
