import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasources/remote_datasources.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthRemoteDataSources remote;

  AuthRepositoriesImpl(this.remote);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await remote.login(email, password);

      if (response.user != null) {
        return Right(response.user!);
      }

      return Left(Failure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String email, String name, String phone, String password) async {
    try {
      final response = await remote.register(email, name, phone, password);

      if (response.user != null) {
        return Right(response.user!);
      }

      return Left(Failure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async => await remote.logout();
}
