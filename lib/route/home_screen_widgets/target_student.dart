import 'package:flutter/material.dart';

class TargetStudent extends StatelessWidget {
  Map<String, dynamic> info = {};

  TargetStudent({super.key, required this.info});

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
          '목표 돈 : ${info['targetMoney']}',
        ),
        Text(
          '목표 기간 : ${info['targetPeriod']}',
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
