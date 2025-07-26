import 'package:flutter/material.dart';
import 'package:snap_lang/screens/home_screen.dart';
import 'package:snap_lang/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _topPosition = -500;
  double _visibility = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _topPosition = 0;
        _visibility = 1;
      });
    });

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _topPosition = -500;
        _visibility = 0;
      });
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(name: 'Andrea')),
      );
    });
  }

  String? _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            top: _topPosition,
            left: 0,
            right: 0,
            bottom: 0,
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 1000),
            child: AnimatedOpacity(
              opacity: _visibility,
              duration: const Duration(milliseconds: 600),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome to Snap Lang!'),
                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {
                        if (_name == null || _name!.isEmpty) {
                          // Navigator.pushNamed(context, "/login");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } else {
                          // Navigator.pushNamed(context, "/home");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(name: _name),
                            ),
                          );
                        }
                      },
                      child: Text(_name == null ? 'Go to Login' : 'Go to Home'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
