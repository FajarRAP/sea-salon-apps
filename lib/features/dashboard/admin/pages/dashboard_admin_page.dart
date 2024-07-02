import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_submission/core/common/snackbar.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart'
    as c;
import 'package:sea_submission/features/auth/presentation/pages/login_page.dart';
import 'package:sea_submission/inject.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardAdminPage extends StatelessWidget {
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<c.AuthCubit>();
    authCubit.currentUser = getIt<SupabaseClient>().auth.currentUser;

    return BlocListener<c.AuthCubit, c.AuthState>(
      listener: (context, state) {
        if (state is c.SessionDestroyed) {
          successSnackbar('Berhasil Logout', context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => print(authCubit.currentUser),
              child: const Text('See User'),
            ),
            ElevatedButton(
              onPressed: authCubit.logout,
              child: BlocBuilder<c.AuthCubit, c.AuthState>(
                builder: (context, state) {
                  if (state is c.SessionDestroying) {
                    return const CircularProgressIndicator();
                  }
                  return const Text('Logout');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
