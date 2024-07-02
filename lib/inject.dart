import 'package:get_it/get_it.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sea_submission/features/review/data/datasources/remote_datasources.dart';
import 'package:sea_submission/features/review/data/repositories/review_repository_impl.dart';
import 'package:sea_submission/features/review/domain/repositories/review_repository.dart';
import 'package:sea_submission/features/review/domain/usecases/insert_review_use_case.dart';
import 'package:sea_submission/features/review/presentation/cubit/review_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/datasources/remote_datasources.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repositories.dart';
import 'features/auth/domain/usecases/login_use_case.dart';
import 'features/auth/domain/usecases/logout_use_case.dart';
import 'features/auth/domain/usecases/register_use_case.dart';

final getIt = GetIt.instance;

void setup() {
  // Supabase
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSources>(
      () => AuthRemoteDataSourcesImpl(getIt()));
  getIt.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(getIt()));

  // Auth Use Case
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));

  // Auth Cubit
  getIt.registerLazySingleton(
    () => AuthCubit(
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      logoutUseCase: getIt(),
    ),
  );

  // Review
  getIt.registerLazySingleton<ReviewRemoteDataSources>(
      () => ReviewRemoteDataSourcesImpl(getIt()));
  getIt.registerLazySingleton<ReviewRepository>(
      () => ReviewRepositoryImpl(getIt()));

  // Review Use Case
  getIt.registerLazySingleton(() => InsertReviewUseCase(getIt()));

  // Review Cubit
  getIt.registerLazySingleton(() => ReviewCubit(insertReviewUseCase: getIt()));
}
