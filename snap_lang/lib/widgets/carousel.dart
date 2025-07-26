import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:snap_lang/utils/theme.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  final List<FlipCardController> controllers = List.generate(
    3,
    (index) => FlipCardController(),
  );

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      scrollDirection: Axis.horizontal,
      shrinkExtent: 120,
      itemExtent: 120,
      onTap: (i) => controllers[i].flipcard(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      children: List.generate(3, (i) {
        return FlipCard(
          frontWidget: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/200"),
              ),
            ),
          ),
          backWidget: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Back Widget",
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ),
            ),
          ),
          rotateSide: RotateSide.left,
          onTapFlipping: true,
          animationDuration: const Duration(milliseconds: 500),
          controller: controllers[i],
        );
      }),
    );
  }
}
