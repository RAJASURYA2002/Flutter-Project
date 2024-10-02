// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:keycloack/home.dart';

const storage = FlutterSecureStorage();

void main() {
  runApp(
    const MaterialApp(
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  const Login({super.key});
  static const String id = "hrms_login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // This function will handle login logic
  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Call Keycloak API to authenticate
      try {
        final response = await _loginToKeycloak(email, password);
        if (response != null) {
          // Save token to secure storage
          await storage.write(
              key: 'access_token', value: response['access_token']);

          // Navigate to home page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Show error if login fails
          _showErrorDialog('Invalid credentials');
        }
      } catch (e) {
        print(e);
        _showErrorDialog('Login failed. Please try again.');
      }
    }
  }

  Future<Map<String, dynamic>?> _loginToKeycloak(
      String email, String password) async {
    final url = Uri.parse(
        'http://10.0.2.2:8282/realms/hrm-realm/protocol/openid-connect/token');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': 'hrm-app',
        'grant_type': 'password',
        'username': email,
        'password': password,
        // 'client_secret':
        //     '<CLIENT_SECRET>' // Optional, only if using a confidential client
      },
    );
    // print("$response⚠️⚠️⚠️⚠️⚠️⚠️");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: const Color(0xffFEFEFE),
        title: const Text(
          "HRM",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xff2C3639),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/login/ritsConsulting-Logo.png",
                width: 90,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "LOGIN",
                style: TextStyle(
                  color: Color(0xff131416),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "Enter your credentials to continue",
                style: TextStyle(
                  color: Color(0xff131416),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Label(
                        label: "Email",
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      InputField(
                        controller: _emailController,
                        labelText: 'Enter your Email',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Label(
                        label: "Password",
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      InputField(
                        controller: _passwordController,
                        labelText: 'Password',
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xff87A2FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: _handleLogin,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xff195BF1),
                            border: Border.all(
                              color: const Color(0xff7593EE),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      style: const TextStyle(
        color: Color(0xff131416),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style:
            const TextStyle(color: Colors.black54 // Text color of entered value
                ),
        decoration: InputDecoration(
          labelText: labelText, // Label text
          labelStyle: const TextStyle(color: Colors.grey), // Label color
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Default border color
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black54), // Border color when focused
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Welcome to Home Page!'),
      ),
    );
  }
}
