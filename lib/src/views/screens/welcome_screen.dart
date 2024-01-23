import 'package:flutter/material.dart';
import 'package:buddy/src/views/widgets/custom_button.dart';
import 'package:buddy/src/views/screens/sign_in_screen.dart';
import 'package:buddy/src/views/screens/sign_up_tourist_screen.dart';
import 'package:buddy/src/views/screens/sign_up_guide_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo image
            Image.asset(
              'assets/images/Logo.png', // Yol doğru olduğunu varsayıyoruz
              height: 300, // Logo boyutunu ayarlayabilirsiniz
            ),
            const SizedBox(height: 48), // Logo ve butonlar arası boşluk
            // 'Sign up for Tourist' butonu
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 50.0), // Buton genişliği için padding
              child: CustomButton(
                text: 'Sign up as Tourist',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpTouristScreen()),
                  );
                  // Turist için kayıt işlevi
                },
              ),
            ),
            const SizedBox(height: 16), // Butonlar arası boşluk
            // 'Sign up for Guide' butonu
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 50.0), // Buton genişliği için padding
              child: CustomButton(
                text: 'Sign up as Guide',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpGuideScreen()),
                  ); // Rehber için kayıt işlevi
                },
              ),
            ),
            const SizedBox(
                height: 32), // Metin ve butonlar arası daha fazla boşluk
            // 'Already have an account? Sign in' metni
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                  // Oturum açma sayfasına yönlendir
                },
                child: const Text('Already have an account? Sign in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
