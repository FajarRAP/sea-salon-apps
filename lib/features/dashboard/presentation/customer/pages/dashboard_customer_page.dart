import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';

class DashboardCustomerPage extends StatelessWidget {
  const DashboardCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
      ),
      body: ElevatedButton(
        onPressed: authCubit.logout,
        child: const Text('Logout'),
      ),
    );
  }
}
