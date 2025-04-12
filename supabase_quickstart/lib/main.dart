import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/pages/account_page.dart';
import 'package:supabase_quickstart/pages/signin_page.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://vqfeqftbibqwmupcuddo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxZmVxZnRiaWJxd211cGN1ZGRvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA3MTU0ODAsImV4cCI6MjA0NjI5MTQ4MH0.qogDjfe_jOX0M79N6K1yXj_iTKq8yA5ATGLYOC6APfQ',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home:
          supabase.auth.currentSession == null
              ? const LoginPage()
              : const AccountPage(),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            isError
                ? Theme.of(this).colorScheme.error
                : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
