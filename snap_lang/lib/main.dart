import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snap_lang/screens/home_screen.dart';
import 'package:snap_lang/screens/main_screen.dart';
import 'package:snap_lang/screens/welcome_screen.dart';
import 'package:snap_lang/utils/theme.dart';

// void main() {
//   runApp(const MainApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      // home: const WelcomeScreen(),
      home: MainScreen(),
      // routes: {
      //   "/": (context) => WelcomeScreen(),
      //   "/login": (context) => LoginScreen(),
      //   "/home": (context) => HomeScreen(),
      //   "/settings": (context) => SettingsScreen(),
      // },
    );
  }
}
