// lib/main.dart
import 'package:flutter/material.dart';
import 'log_in.dart'; // Import your login screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go auto | Customer Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(), // Set initial screen here
      debugShowCheckedModeBanner: false,
    );
  }
}
