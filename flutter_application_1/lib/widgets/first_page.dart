import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/form.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            myForm(
              onSubmit: (String? name) {
                log("Name submitted: $name");
                setState(() {
                  _name = name;
                });
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _name == null || _name!.isEmpty
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        "/second",
                        arguments: {'name': _name},
                      );
                    },
              child: Text("Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
