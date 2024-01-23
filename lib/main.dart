import 'package:flutter/material.dart';
import 'package:buddy/src/views/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUDDY App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Urbanist',
        // Diğer tema ayarları...
      ),
      home: const WelcomeScreen(), // Değiştirildi: WelcomePage -> WelcomeScreen
    );
  }
}
