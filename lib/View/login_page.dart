import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_demo/ViewModel/auth_viewmodel.dart'; // For GetX navigation

class LoginPage extends StatelessWidget {
  final emailState = Get.put(EmailState());
  final passwordState = Get.put(PasswordState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView( // Allow scrolling if content overflows
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                key: const Key('Email'),
                controller: TextEditingController(text: emailState.email.value),
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: emailState.hasInteracted.value && !emailState.isEmailValid.value ? 'Please enter a valid email' : null,
                ),
                onChanged: (text) => emailState.email.value = text,
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('Password'),
                controller: TextEditingController(text: passwordState.password.value),
                obscureText: true, // Hide password text
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: passwordState.hasInteracted.value && !passwordState.isPasswordValid.value ? 'Password is invalid' : null,
                ),
                onChanged: (text) => passwordState.password.value = text,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission (assuming LoginViewModel later)
                  // You'll need to implement login logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form submitted! (placeholder)')),
                  );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}