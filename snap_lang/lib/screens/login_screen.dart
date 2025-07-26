import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snap_lang/screens/home_screen.dart';
import 'package:snap_lang/widgets/form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyForm(
                onSubmit: (String? name) {
                  log("Name submitted: $name");
                  setState(() {
                    _name = name;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("Name entered: ${_name ?? 'None'}"),
              TextButton(
                onPressed: _name == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(name: _name),
                          ),
                        );
                      },
                child: Text("Go to Second Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
