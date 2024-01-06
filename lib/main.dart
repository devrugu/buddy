import 'package:flutter/material.dart';
import 'src/views/screens/welcome_screen.dart'; // Önceki adımda oluşturduğunuz dosyayı buraya dahil edin.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turist Rehber Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
