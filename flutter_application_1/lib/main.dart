import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/first_page.dart';
import 'package:flutter_application_1/widgets/form.dart';
import 'package:flutter_application_1/widgets/second_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => FirstPage(),
        "/second": (BuildContext context) => SecondPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is the second screen"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Back to First Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
