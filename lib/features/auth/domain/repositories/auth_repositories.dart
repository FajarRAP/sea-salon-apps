import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepositories {
  Future<Either<Failure, User>> login(String email, String password); 
  Future<Either<Failure, User>> register(String email, String name, String phone, String password);
  Future<void> logout();
}