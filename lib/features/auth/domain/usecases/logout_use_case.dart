import 'package:sea_submission/features/auth/domain/repositories/auth_repositories.dart';

class LogoutUseCase {
  final AuthRepositories authRepositories;

  LogoutUseCase(this.authRepositories);

  Future<void> execute() async => await authRepositories.logout();
}
