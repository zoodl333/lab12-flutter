import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final dio = Dio();
const _resetPassURL = 'https://sobik.requestcatcher.com/reset';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  void postRequest() async {
    final formData = FormData.fromMap({
      'login': _loginController.text
    });
    final response = await dio.post(_resetPassURL, data: formData);

    if (response.statusCode != 200) {
      print('Something went wrong...');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
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
                                  content: Text("Password reset link sent on your email!"),
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Reset"),
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
