import 'package:flutter/material.dart';
import 'package:sea_submission/cred.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // final AuthResponse res = await supabase.auth.signUp(
              //     email: 'fajary782@gmail.com',
              //     password: 'halodunia',
              //     data: {
              //       'name': 'Fajar Riansyah',
              //     });
              final res = await supabase.auth.signInWithPassword(
                email: 'fajary781@gmail.com',
                password: 'halodunia',
              );
              final session = res.session;
              final user = res.user;
              print(session);
              print(user!.userMetadata?['name']);
            } on AuthException catch (ae) {
              print(ae.message);
            } catch (e) {
              print(e.toString());
            }
          },
          child: const Text('TEST'),
        ),
      ),
    );
  }
}
