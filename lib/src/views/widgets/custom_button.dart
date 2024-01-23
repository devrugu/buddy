// custom_button.dart

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color; // Butonun arka plan rengini özelleştirmek için eklendi
  final Color? textColor; // Butonun metin rengini özelleştirmek için eklendi

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color, // Yeni parametre
    this.textColor, // Yeni parametre
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Colors.white,
        backgroundColor: color ??
            Theme.of(context).primaryColor, // Metin rengi özelleştirilebilir
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomDrawerButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.zero, // Tam genişlik için borderRadius sıfır
          ),
          padding:
              const EdgeInsets.symmetric(vertical: 20.0), // Daha fazla padding
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
} // custom_button.dart içinde

// ... (Mevcut CustomButton widget kodları)
