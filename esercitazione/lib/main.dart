import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? pin;
  bool isValid = false;

  void onPress(String? value) {
    setState(() {
      if (pin == null) {
        pin = value;
      } else {
        pin = "$pin$value";
      }
    });
  }

  validate() {
    if (pin != null && pin == "1234") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("PIN corretto!")));
      setState(() {
        isValid = true;
        pin = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("PIN errato!"),
          duration: const Duration(seconds: 1),
        ),
      );
      setState(() {
        isValid = false;
      });
    }
  }

  onDeleteLastDigit() {
    setState(() {
      if (pin != null && pin!.isNotEmpty) {
        pin = pin!.substring(0, pin!.length - 1);
      }
    });
  }

  logout() {
    setState(() {
      isValid = false;
      pin = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Visibility(
          replacement: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                  children: [
                    const TextSpan(text: 'PIN corretto '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.verified,
                        size: 24,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: logout, child: const Text("Indietro")),
            ],
          ),
          visible: !isValid,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login: ${pin ?? ""}",
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(174, 91, 65, 126),
                ),
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  children: List.generate(9, (index) {
                    final int numero = index + 1;
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextButton(
                        onPressed: () {
                          onPress(numero.toString());
                        },
                        style: TextButton.styleFrom(
                          // backgroundColor: Colors.blue,
                          shape: OvalBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        child: Text(
                          "$numero",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: onDeleteLastDigit,
                    label: Icon(Icons.backspace),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pin = null;
                      });
                    },
                    child: Text("CANCELLA"),
                  ),
                  ElevatedButton(onPressed: validate, child: Text("Invia")),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
