import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TargetCompany extends StatelessWidget {
  Map<String, dynamic> info = {};

  TargetCompany({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    print("info");
    print(info);

    var cmCal = info['currentMoney'] / info['targetMoney'];
    var cmCals = info['currentMoney'] / info['targetMoney'] * 100;
    double cmPercent = double.parse(cmCals.toStringAsFixed(2));

    num currentMoneyCal = info['currentMoney'] / info['targetMoney'] * 300;
    double currentMoneyPercent = currentMoneyCal.round().toDouble();
    print(currentMoneyPercent);

    num salaryCal = info['salary'] / info['targetMoney'] * 300;
    double salaryPercent = salaryCal.round().toDouble();
    print(salaryPercent);

    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: '목표 금액',
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 100,
        tooltip: "20 Pcs",
        description: Text(
          '${info['targetMoney']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 0,
        label: '현재 보유 돈',
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: currentMoneyPercent,
        tooltip: "20 Pcs",
        description: Text(
          '${info['currentMoney']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 0,
        label: '목표 기간',
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 100,
        tooltip: "20 Pcs",
        description: Text(
          '${info['targetPeriod']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 1,
        label: "월급",
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: salaryPercent,
        tooltip: "55 Pcs",
        description: Text(
          '${info['salary']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 0,
        label: '이번달 추가수입',
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 100,
        tooltip: "20 Pcs",
        description: Text(
          '${info['addIncome']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 2,
        label: "고정 지출비",
        colors: [Colors.teal, Colors.indigo],
        jumlah: 20,
        tooltip: "12 Pcs",
        description: Text(
          '${info['fixPay']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      VBarChartModel(
        index: 0,
        label: '이번달 추가 지출비',
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 100,
        tooltip: "20 Pcs",
        description: Text(
          '${info['addPay']}',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    ];

    var data = [
      _ChartData('저축', 70.0),
      _ChartData('고정 지출', 20.0),
      _ChartData('추가 지출', 10.0),
    ];
    var tooltip = TooltipBehavior(enable: true);

    return Column(children: [
      const SizedBox(
        height: 15,
      ),
      CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 17.0,
        animation: true,
        percent: cmCal,
        center: Text(
          "$cmPercent%",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        footer: const Text(
          "달성률",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.purple,
      ),
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
      const Text(
        "내 수익 사용차트",
      ),
      SfCircularChart(
        tooltipBehavior: tooltip,
        series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              explode: true,
              // Explode all the segments
              name: '단위%')
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Text(
        "전달 비교",
      ),
    ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
