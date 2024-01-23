import 'package:flutter/material.dart';
import 'package:buddy/src/views/widgets/custom_text_form_field.dart';
import 'package:buddy/src/views/widgets/custom_button.dart';

class SignUpGuideScreen extends StatefulWidget {
  const SignUpGuideScreen({super.key});

  @override
  _SignUpGuideScreenState createState() => _SignUpGuideScreenState();
}

class _SignUpGuideScreenState extends State<SignUpGuideScreen> {
  DateTime? _selectedDate;
  String? _selectedCountry;
  final _countries = ['USA', 'Canada', 'Mexico', 'Japan'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up as Guide'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0466C8)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const CustomTextFormField(
              labelText: 'Full Name',
              hintText: 'Enter your full name',
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              labelText: 'Username',
              hintText: 'Choose a username',
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              labelText: 'Password',
              hintText: 'Create a password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              labelText: 'TC No',
              hintText: 'Enter your TC No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Date of Birth',
              hintText:
                  _selectedDate?.toString() ?? 'Select your date of birth',
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              items: _countries.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCountry = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Country',
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Register',
              onPressed: () {
                // Handle registration
              },
            ),
          ],
        ),
      ),
    );
  }
}
