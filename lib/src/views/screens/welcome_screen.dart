import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_button.dart';
import 'sign_up_screen.dart';
import '../../utils/route_transitions.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 248, 226, 165),
              Color.fromARGB(255, 237, 238, 163)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/buddy_logo.svg',
              height: 100, // Logo boyutunu ayarlayın
            ),
            const SizedBox(height: 40),
            const Text(
              'Yeni Maceralara Hazır Mısınız?',
              style: TextStyle(
                fontSize: 28,
                color: Color.fromARGB(255, 46, 51, 54),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: 'Giriş Yap',
              backgroundColor: const Color.fromARGB(255, 250, 225, 172),
              textColor: const Color.fromARGB(255, 46, 51, 54),
              onPressed: () {
                // Giriş sayfasına yönlendirme işlemi
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Kaydol',
              backgroundColor: const Color.fromARGB(255, 250, 225, 172),
              textColor: const Color.fromARGB(255, 46, 51, 54),
              onPressed: () {
                Navigator.push(
                  context,
                  slideTransitionRoute(const SignUpScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
