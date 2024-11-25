import 'package:flutter/material.dart';
import 'package:lab06/main.dart';
import 'package:dio/dio.dart';

final dio = Dio();
const _registerURL = 'https://sobik.requestcatcher.com/register';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  void postRequest() async {
    final formData = FormData.fromMap({
      'email': _emailController.text,
      'login': _loginController.text,
      'password': _passwordController.text
    });
    final response = await dio.post(_registerURL, data: formData);

    if (response.statusCode != 200) {
      print('Something went wrong...');
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleTheme = DefaultTheme().themeData.textTheme.titleLarge;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Center(
                  child: Text('Sign Up', style: titleTheme),
                ),
              ),
              // Name Field
              const Text('Email:'),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                ),
                keyboardType: TextInputType.emailAddress,
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

              const Text('Login:'),
              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Login is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),

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
                                  content: Text("Sign Up Successful!"),
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Back"),
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
