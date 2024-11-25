import 'package:flutter/material.dart';
import './reset_password_screen.dart';
import './signup_screen.dart';
import 'package:lab06/main.dart';
import 'package:dio/dio.dart';

final dio = Dio();
const _loginURL = 'https://sobik.requestcatcher.com/login';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void postRequest() async {
    final formData = FormData.fromMap({
      'email': _emailController.text,
      'password': _passwordController.text
    });
    final response = await dio.post(_loginURL, data: formData);

    if (response.statusCode != 200) {
      print('Something went wrong...');
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputTextTheme = DefaultTheme().themeData.textTheme.bodyMedium;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 15.0),

              // Login Field
              const Text('Email:'),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter the correct email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),

              // Password Field
              const Text('Password:'),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }

                  if (value.length < 7) {
                    return 'Password must be at least 7 characters long';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 25.0),

              // Sign Up Button
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Login and Reset Password Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            postRequest();
                            showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return const AlertDialog(
                                  title: Text('Message'),
                                  content: Text("Login Successful!"),
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text("Reset password"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
