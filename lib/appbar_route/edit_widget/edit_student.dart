import 'package:flutter/material.dart';

class EditStudent extends StatelessWidget {
  final double screenWidth;

  const EditStudent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: screenWidth - 26,
          child: const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '이번달 용돈',
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: screenWidth - 26,
          child: const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '이번달 지출비',
            ),
          ),
        ),
      ],
    );
  }
}
