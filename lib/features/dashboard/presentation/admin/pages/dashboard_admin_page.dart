import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';

class DashboardAdminPage extends StatelessWidget {
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: ElevatedButton(
        onPressed: authCubit.logout,
        child: const Text('Logout'),
      ),
    );
  }
}
