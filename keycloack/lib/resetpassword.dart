import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keycloack/main.dart';

class ResetPasswordPage extends StatefulWidget {
  final String userId;

  const ResetPasswordPage({super.key, required this.userId});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _message = '';

  get http => null;

  Future<void> _updatePassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _message = '';
      });

      final newPassword = _passwordController.text;
      final url =
          'http://10.0.2.2:8282/admin/realms/hrm-realm/users/${widget.userId}/reset-password';

      try {
        final response = await http.put(
          Uri.parse(url),
          headers: {
            'Authorization':
                'Bearer <admin_access_token>', // Replace with valid admin token
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'type': 'password',
            'temporary': false,
            'value': newPassword,
          }),
        );

        if (response.statusCode == 204) {
          setState(() {
            _message = 'Password successfully updated!';
          });
        } else {
          setState(() {
            _message = 'Failed to update password. Please try again.';
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
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(
                controller: _passwordController,
                labelText: 'Enter new Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: _updatePassword,
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
                            "Update Password",
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
