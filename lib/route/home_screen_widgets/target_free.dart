import 'package:flutter/material.dart';

class TargetFree extends StatelessWidget {
  Map<String, dynamic> info = {};

  TargetFree({super.key, required this.info});

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
          '이번달 수입 : ${info['income']}',
        ),
        Text(
          '추가 수입 : ${info['addIncome']}',
        ),
        Text(
          '고정 지출 : ${info['fixPay']}',
        ),
        Text(
          '추가 지출 : ${info['addPay']}',
        ),
      ],
    );
  }
}
