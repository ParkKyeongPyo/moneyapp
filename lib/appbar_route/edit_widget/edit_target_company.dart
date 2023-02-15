import 'package:flutter/material.dart';

import '../edit_screen.dart';

class EditTargetCompany extends StatelessWidget {
  final double screenWidth;

  const EditTargetCompany({super.key, required this.screenWidth});

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenWidth / 2 - 20,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '월급',
                ),
                onChanged: (value) {
                  EditScreen.salary = int.parse(value);
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
