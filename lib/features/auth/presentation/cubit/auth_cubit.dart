import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sea_submission/features/auth/domain/usecases/login_use_case.dart';
import 'package:sea_submission/features/auth/domain/usecases/logout_use_case.dart';
import 'package:sea_submission/features/auth/domain/usecases/register_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial());

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  User? currentUser;

  Future<void> login(String email, String password) async {
    emit(LoginAuthenticating());

    final result = await loginUseCase.execute(email, password);

    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (success) => emit(LoginAuthenticated(success)),
    );
  }

  Future<void> register(
      String name, String phone, String email, String password) async {
    emit(RegisterAuthenticating());

    final result = await registerUseCase.execute(email, name, phone, password);

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (success) => emit(RegisterAuthenticated()),
    );
  }

  Future<void> logout() async {
    emit(SessionDestroying());

    await logoutUseCase.execute();

    emit(SessionDestroyed());
  }
}
