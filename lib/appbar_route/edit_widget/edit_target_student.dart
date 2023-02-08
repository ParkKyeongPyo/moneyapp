import 'package:flutter/material.dart';

class EditTargetStudent extends StatelessWidget {
  final double screenWidth;

  const EditTargetStudent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenWidth / 2 - 20,
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '목표 금액',
                ),
              ),
            ),
            SizedBox(
              width: screenWidth / 2 - 20,
              child: const TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '목표 기간',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
