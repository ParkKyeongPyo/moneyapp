import 'package:flutter/material.dart';

import '../edit_screen.dart';

class EditFree extends StatelessWidget {
  final double screenWidth;

  const EditFree({super.key, required this.screenWidth});

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
                  labelText: '이번달 수입',
                ),
                onChanged: (value) {
                  EditScreen.income = int.parse(value);
                },
              ),
            ),
            SizedBox(
              width: screenWidth / 2 - 20,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이번달 추가 수입',
                ),
                onChanged: (value) {
                  EditScreen.addIncome = int.parse(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenWidth / 2 - 20,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '고정 지출비',
                ),
                onChanged: (value) {
                  EditScreen.fixPay = int.parse(value);
                },
              ),
            ),
            SizedBox(
              width: screenWidth / 2 - 20,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이번달 추가 지출비',
                ),
                onChanged: (value) {
                  EditScreen.addPay = int.parse(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
