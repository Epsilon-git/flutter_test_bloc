import 'package:flutter/material.dart';
import 'package:flutter_test_bloc/core/di/di.dart';
import 'package:flutter_test_bloc/features/auth/ui/auth_page.dart';

Future<void> main() async {
  await initDI();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent.shade700),
      ),
      home: AuthPage(),
    );
  }
}
