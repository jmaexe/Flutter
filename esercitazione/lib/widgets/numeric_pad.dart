import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumericPad extends StatelessWidget {
  final void Function(String?) onPress;
  const NumericPad({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(174, 91, 65, 126),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12.0,
        runSpacing: 12.0,
        children: List.generate(9, (index) {
          final int numero = index + 1;
          return SizedBox(
            width: 90,
            height: 90,
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
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          );
        }),
      ),
    );
  }
}
