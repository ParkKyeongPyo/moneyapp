import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  Map<String, dynamic> info = {};

  Company({super.key, required this.info});

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
          '월급 : ${info['salary']}',
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
