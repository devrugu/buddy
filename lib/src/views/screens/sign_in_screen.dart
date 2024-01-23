import 'package:flutter/material.dart';
import 'package:buddy/src/views/widgets/custom_text_form_field.dart';
import 'package:buddy/src/views/widgets/custom_button.dart';
import 'package:buddy/src/views/screens/forget_password_screen.dart';
import 'package:buddy/src/views/screens/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to Your Account',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0466C8)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextFormField(
                hintText: 'Email',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'Password',
                labelText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  // Navigator.push metodunu kullanarak HomeScreen sayfasına git
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  ); // Sign in action
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen()),
                  );
                  // Forgot password action
                },
                child: const Text(
                  'I forgot my password',
                  style: TextStyle(color: Color(0xFF0466C8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
