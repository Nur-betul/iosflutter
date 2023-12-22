import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:superbase_f/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://flijeczgyneiuszseojp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZsaWplY3pneW5laXVzenNlb2pwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA2ODUwMjYsImV4cCI6MjAxNjI2MTAyNn0.t0aYIh_gUJo9_pvF1QcDGOEPswN4ZI9iwFOoxF7OKg0');

  final client = SupabaseClient('https://flijeczgyneiuszseojp.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZsaWplY3pneW5laXVzenNlb2pwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA2ODUwMjYsImV4cCI6MjAxNjI2MTAyNn0.t0aYIh_gUJo9_pvF1QcDGOEPswN4ZI9iwFOoxF7OKg0');
  runApp(MyApp(client: client));
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  final SupabaseClient client;

  const MyApp({super.key, required this.client});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Supabase Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: LoginPage(client: client),
    );
  }
}
