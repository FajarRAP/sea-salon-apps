import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/auth/domain/repositories/auth_repositories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUseCase {
  final AuthRepositories authRepositories;

  LoginUseCase(this.authRepositories);

  Future<Either<Failure, User>> execute(String email, String password) async =>
      await authRepositories.login(email, password);
}
