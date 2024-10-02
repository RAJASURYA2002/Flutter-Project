import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keycloak Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ForgetPassword(),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _message = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Function to get the admin access token from Keycloak
  Future<String?> getAdminAccessToken() async {
    const tokenUrl =
        'http://10.0.2.2:8282/realms/hrm-realm/protocol/openid-connect/token';
    const clientId = 'admin-cli'; // The client ID for admin
    // const clientSecret =
    //     'your-client-secret'; // The client secret (if required)
    const username = 'Surya'; // Admin username
    const password = 'Surya@2002'; // Admin password

    try {
      final response = await http.post(
        Uri.parse(tokenUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'client_id': clientId,
          // 'client_secret': clientSecret, // Include if necessary
          'grant_type': 'password',
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['access_token'];
      } else {
        print('Failed to get token: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Function to send a password reset link via email
  Future<void> _sendResetEmail(String userId) async {
    const resetPasswordUrl =
        'http://10.0.2.2:8282/admin/realms/hrm-realm/users/';

    try {
      // Get the admin access token
      final token = await getAdminAccessToken();
      if (token == null) {
        setState(() {
          _message = 'Failed to authenticate. Please try again later.';
        });
        return;
      }

      // Send the reset password email
      final response = await http.put(
        Uri.parse('$resetPasswordUrl$userId/reset-password-email'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "redirectUri": "http://10.0.2.2:8282:*/",
        }),
      );

      if (response.statusCode == 204) {
        setState(() {
          _message = 'A reset password link has been sent to your email.';
        });
      } else {
        setState(() {
          _message = 'Failed to send reset email. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error: $e';
      });
    }
  }

  // Function to check if the entered email exists in Keycloak
  Future<void> _checkEmailExists() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _message = '';
      });

      final email = _emailController.text;
      const searchUrl =
          'http://10.0.2.2:8282/admin/realms/hrm-realm/users?email=';

      try {
        // Get the admin access token
        final token = await getAdminAccessToken();
        if (token == null) {
          setState(() {
            _message = 'Failed to authenticate. Please try again later.';
          });
          return;
        }

        // Make the request to Keycloak API
        final response = await http.get(
          Uri.parse(searchUrl + email),
          headers: {
            'Authorization': 'Bearer $token', // Use the token here
            'Content-Type': 'application/json',
          },
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        if (response.statusCode == 200 && response.body.isNotEmpty) {
          final List<dynamic> users = jsonDecode(response.body);

          if (users.isNotEmpty) {
            final userId =
                users.first['id']; // Get the user ID from the response

            // Call the function to send the reset email
            _sendResetEmail(userId);
          } else {
            setState(() {
              _message = 'Email not found. Please enter a valid email.';
            });
          }
        } else {
          setState(() {
            _message = 'Failed to verify email. Please try again.';
          });
        }
      } catch (e) {
        setState(() {
          _message = 'Error: $e';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(
                controller: _emailController,
                labelText: 'Enter your Email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: _checkEmailExists,
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
                    ),
              const SizedBox(height: 16),
              Text(
                _message,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
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
        style: const TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
