import 'package:flutter/material.dart';

import 'edit_widget/edit_company.dart';
import 'edit_widget/edit_free.dart';
import 'edit_widget/edit_student.dart';
import 'edit_widget/edit_target_company.dart';
import 'edit_widget/edit_target_free.dart';
import 'edit_widget/edit_target_student.dart';

const List<Widget> jobList = <Widget>[
  Text('직장인'),
  Text('프리랜서'),
  Text('알바생'),
  Text('무직/학생'),
];

const List<String> jobTextList = <String>[
  "직장인",
  "프리랜서",
  "알바생",
  "무직/학생",
];

const List<Widget> targetList = <Widget>[
  Text('있음'),
  Text('없음'),
];

const List<String> targetTextList = <String>[
  "있음",
  "없음",
];

class EditScreen extends StatefulWidget {
  String userID = "";
  String? userEmail = "";

  String target = "있음";
  String job = "company";
  int currentMoney = 0;
  int targetMoney = 0;
  int salary = 0;
  int addIncome = 0;
  int fixPay = 0;
  int addPay = 0;

//freelancer
  int income = 0;

//student
  int pinMoney = 0;
  int monthPay = 0;

  EditScreen({super.key, required this.userID, required this.userEmail});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  //왜 final인데도 에러가 없는지 이해가 안된다.
  final List<bool> _selectedJobList = <bool>[true, false, false, false];
  final List<bool> _selectedTargetList = <bool>[true, false];

  var selectedJobIndex = 0;
  var selectedTargetIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            tooltip: 'Return',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Edit"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('목표 돈 유무'),
                const SizedBox(
                  height: 5,
                ),
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedTargetList.length; i++) {
                        _selectedTargetList[i] = i == index;

                        if (i == index) selectedTargetIndex = index;
                      }

                      target = targetTextList[selectedTargetIndex];
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.red[200],
                  color: Colors.red[400],
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  isSelected: _selectedTargetList,
                  children: targetList,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('현재 직업'),
                const SizedBox(
                  height: 5,
                ),
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedJobList.length; i++) {
                        _selectedJobList[i] = i == index;

                        if (i == index) selectedJobIndex = index;
                      }

                      job = jobTextList[selectedJobIndex];
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.red[200],
                  color: Colors.red[400],
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  isSelected: _selectedJobList,
                  children: jobList,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth - 26,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '현재 보유 금액',
                    ),
                    onChanged: (value) {
                      EditScreen.currentMoney = int.parse(value);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedTargetIndex == 0) ...[
                  if (selectedJobIndex == 2 || selectedJobIndex == 0)
                    EditTargetCompany(screenWidth: screenWidth)
                  else if (selectedJobIndex == 1)
                    EditTargetFree(screenWidth: screenWidth)
                  else
                    EditTargetStudent(screenWidth: screenWidth)
                ] else ...[
                  if (selectedJobIndex == 2 || selectedJobIndex == 0)
                    EditCompany(screenWidth: screenWidth)
                  else if (selectedJobIndex == 1)
                    EditFree(screenWidth: screenWidth)
                  else
                    EditStudent(screenWidth: screenWidth)
                ],
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("저장"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
