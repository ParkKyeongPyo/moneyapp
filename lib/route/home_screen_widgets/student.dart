import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

class Student extends StatelessWidget {
  Map<String, dynamic> info = {};

  Student({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    print("info");
    print(info);

    num pinMoneyCal = info['pinMoney'] / info['currentMoney'] * 300;
    double pinMoneyPercent = pinMoneyCal.round().toDouble();
    print(pinMoneyPercent);

    num monthPayCal = info['monthPay'] / info['currentMoney'] * 300;
    double monthPayPercent = monthPayCal.round().toDouble();
    print(monthPayPercent);

    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: '현재 보유 돈',
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 100,
        tooltip: "20 Pcs",
        description: Text(
          '${info['currentMoney']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 1,
        label: "이번달 용돈",
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: pinMoneyPercent,
        tooltip: "55 Pcs",
        description: Text(
          '${info['pinMoney']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 2,
        label: "이번달 지출",
        colors: [Colors.teal, Colors.indigo],
        jumlah: monthPayPercent,
        tooltip: "12 Pcs",
        description: Text(
          '${info['monthPay']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    ];

    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        VerticalBarchart(
          maxX: 100,
          data: bardata,
          showLegend: false,
          alwaysShowDescription: false,
          barSize: 20,
          legend: const [
            Vlegend(
              isSquare: false,
              color: Colors.orange,
              text: "Fruits",
            ),
            Vlegend(
              isSquare: false,
              color: Colors.teal,
              text: "Vegetables",
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
