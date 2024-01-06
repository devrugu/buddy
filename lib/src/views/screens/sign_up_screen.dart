import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kayıt Ol',
          style: TextStyle(
            color: Color.fromARGB(255, 46, 51, 54), // Change the color here
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 250, 225, 172), // Tema rengi
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.lightBlue.shade200, Colors.lightBlue.shade600],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/airtable.svg', // Temaya uygun bir ikon veya logo
              height: 100,
            ),
            const SizedBox(height: 40),
            const Text(
              'Yeni Maceralara Katılın',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: 'Turist Olarak Kayıt Ol',
              backgroundColor: const Color.fromARGB(255, 250, 225, 172),
              textColor: const Color.fromARGB(255, 46, 51, 54),
              onPressed: () {
                //Turist olarak kayıt ekranına yönlendirme
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Rehber Olarak Kayıt Ol',
              backgroundColor: const Color.fromARGB(255, 250, 225, 172),
              textColor: const Color.fromARGB(255, 46, 51, 54),
              onPressed: () {
                //Rehber olarak kayıt ekranına yönlendirme
              },
            ),
          ],
        ),
      ),
    );
  }
}
