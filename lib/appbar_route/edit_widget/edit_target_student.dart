import 'package:flutter/material.dart';

import '../edit_screen.dart';

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
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '목표 금액',
                ),
                onChanged: (value) {
                  EditScreen.targetMoney = int.parse(value);
                },
              ),
            ),
            SizedBox(
              width: screenWidth / 2 - 20,
              child: TextField(
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '목표 기간',
                ),
                onChanged: (value) {
                  EditScreen.targetPeriod = int.parse(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
