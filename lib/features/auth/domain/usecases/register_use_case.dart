import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/auth/domain/repositories/auth_repositories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterUseCase {
  final AuthRepositories authRepositories;

  RegisterUseCase(this.authRepositories);

  Future<Either<Failure,User>> execute(String email, String name, String phone, String password) async =>
      await authRepositories.register(email, name, phone, password);
}
