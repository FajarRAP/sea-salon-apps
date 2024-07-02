import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_submission/cred.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sea_submission/features/dashboard/admin/pages/dashboard_admin_page.dart';
import 'package:sea_submission/features/dashboard/customer/pages/dashboard_customer_page.dart';
import 'package:sea_submission/features/home/home_page.dart';
import 'package:sea_submission/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:sea_submission/features/review/presentation/cubit/review_cubit.dart';
import 'package:sea_submission/inject.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonKey,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final role =
        getIt<SupabaseClient>().auth.currentSession?.user.userMetadata?['role'];
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<ReviewCubit>()),
        BlocProvider(create: (context) => getIt<ReservationCubit>()),
      ],
      child: MaterialApp(
        title: 'SEA Salon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: role == 0
            ? const DashboardCustomerPage()
            : role == 1
                ? const DashboardAdminPage()
                : const HomePage(),
      ),
    );
  }
}



      // Center(
      //   child: ElevatedButton(
      //     onPressed: () async {
      //       try {
      //         // final AuthResponse res = await supabase.auth.signUp(
      //         //     email: 'fajary782@gmail.com',
      //         //     password: 'halodunia',
      //         //     data: {
      //         //       'full_name': 'Fajar Riansyah',
      //         //     });

      //         final res = await supabase.auth.signInWithPassword(
      //           email: 'fajary781@gmail.com',
      //           password: 'halodunia',
      //         );

      //         // final session = res.session;
      //         // final user = res.user;
      //         // print(session);
      //         // print(user!.userMetadata?['name']);
      //         print(supabase.auth.currentSession);
      //       } on AuthException catch (ae) {
      //         print(ae.message);
      //       } catch (e) {
      //         print(e.toString());
      //       }
      //     },
      //     child: const Text('TEST'),
      //   ),
      // ),


