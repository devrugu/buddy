import 'package:flutter/material.dart';
import 'dart:async';

class ResendCodeScreen extends StatefulWidget {
  const ResendCodeScreen({super.key});

  @override
  _ResendCodeScreenState createState() => _ResendCodeScreenState();
}

class _ResendCodeScreenState extends State<ResendCodeScreen> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: Color(0xFF0466C8), size: 24),
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
              Image.asset(
                'assets/images/forgetpassword.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Code has been sent to +90 553 *****53',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.all(8),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: "",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24.0),
              Text('Resend code in $_start s',
                  style: const TextStyle(color: Color(0xFF0466C8))),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _start == 0
                    ? () {
                        // Resend code functionality
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF0466C8),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Resend code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
