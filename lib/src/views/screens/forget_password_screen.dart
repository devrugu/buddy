import 'package:flutter/material.dart';
import 'package:buddy/src/views/screens/resend_code_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Image.asset(
                  'assets/images/forgetpassword.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              const Text(
                'Select which contact details should we use to reset your password',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              ListTile(
                leading: const Icon(Icons.message, color: Color(0xFF0466C8)),
                title: const Text('+90 553 *****53'),
                onTap: () {
                  setState(() {
                    selectedMethod = 'SMS';
                  });
                },
                tileColor: selectedMethod == 'SMS' ? Colors.blue[50] : null,
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF0466C8)),
                title: const Text('ahm***im@gmail.com'),
                onTap: () {
                  setState(() {
                    selectedMethod = 'Email';
                  });
                },
                tileColor: selectedMethod == 'Email' ? Colors.blue[50] : null,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: selectedMethod != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResendCodeScreen()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF0466C8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
