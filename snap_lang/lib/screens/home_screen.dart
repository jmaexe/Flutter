import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snap_lang/screens/take_picture_screen.dart';
import 'package:snap_lang/widgets/carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name});

  final String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Lottie.asset('assets/letters_animation.json'),
                    ),
                    // Positioned.fill(
                    //   child: Container(color: Colors.white.withAlpha(100)),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Text("Recenti"),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(),
                      child: Carousel(),
                    ),
                    Text("Popolari"),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(),
                      child: Carousel(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log("Opening camera screen");
          try {
            final cameras = await availableCameras();
            if (cameras.isEmpty) {
              log("No cameras found");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Nessuna fotocamera disponibile')),
              );
              return;
            }
            final firstCamera = cameras.first;

            if (!context.mounted) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakePictureScreen(camera: firstCamera),
              ),
            );
          } catch (e) {
            log("Error fetching cameras: $e");
            return;
          }
        },
        mini: true,
        child: Icon(Icons.add),
      ),
    );
  }
}
