import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_submission/core/common/snackbar.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sea_submission/features/auth/presentation/pages/register_page.dart';
import 'package:sea_submission/features/dashboard/admin/pages/dashboard_admin_page.dart';
import 'package:sea_submission/features/dashboard/customer/pages/dashboard_customer_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginError) {
          errorSnackbar(state.message, context);
        }
        if (state is LoginAuthenticated) {
          successSnackbar('Berhasil Login', context);
          if (state.user.userMetadata?['role'] == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardCustomerPage()));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardAdminPage()));
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'email'),
                  validator: (value) => value!.isEmpty ? 'Isi Formnya' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'password'),
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'Isi Formnya' : null,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      authCubit.login(emailController.text.trim(),
                          passwordController.text.trim());
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is LoginAuthenticating) {
                        return const CircularProgressIndicator();
                      }
                      return const Text('Login');
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage())),
                    child: const Text('Register here'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
