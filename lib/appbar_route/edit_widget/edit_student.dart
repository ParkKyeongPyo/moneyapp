import 'package:flutter/material.dart';

import '../edit_screen.dart';

class EditStudent extends StatelessWidget {
  final double screenWidth;

  const EditStudent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: screenWidth - 26,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '이번달 용돈',
            ),
            onChanged: (value) {
              EditScreen.pinMoney = int.parse(value);
            },
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: screenWidth - 26,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '이번달 지출비',
            ),
            onChanged: (value) {
              EditScreen.monthPay = int.parse(value);
            },
          ),
        ),
      ],
    );
  }
}
