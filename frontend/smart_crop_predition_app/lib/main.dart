import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const AgroApp());
}

class AgroApp extends StatelessWidget {
  const AgroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGRO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}