import 'package:flutter/material.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenWidth / 2 - 20,
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '월급',
                ),
              ),
            ),
            SizedBox(
              width: screenWidth / 2 - 20,
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이번달 추가 수입',
                ),
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
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '고정 지출비',
                ),
              ),
            ),
            SizedBox(
              width: screenWidth / 2 - 20,
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이번달 추가 지출비',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }   
}
