import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  Map<String, dynamic> info = {};

  Student({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    print("info");
    print(info);
    return Column(
      children: [
        Text(
          '현재 보유 돈 : ${info['currentMoney']}',
        ),
        Text(
          '이번달 용돈 : ${info['pinMoney']}',
        ),
        Text(
          '이번달 지출비 : ${info['monthPay']}',
        ),
      ],
    );
  }
}
