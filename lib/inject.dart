import 'package:get_it/get_it.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/datasources/remote_datasources.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repositories.dart';
import 'features/auth/domain/usecases/login_use_case.dart';
import 'features/auth/domain/usecases/logout_use_case.dart';
import 'features/auth/domain/usecases/register_use_case.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
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
}
