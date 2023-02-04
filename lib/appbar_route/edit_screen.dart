import 'package:flutter/material.dart';

const List<Widget> jobList = <Widget>[
  Text('직장인'),
  Text('프리랜서'),
  Text('알바생'),
  Text('무직'),
];

const List<Widget> targetList = <Widget>[
  Text('있음'),
  Text('없음'),
];

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final List<bool> _selectedJobList = <bool>[true, false, false, false];
  final List<bool> _selectedTargetList = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
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
        body: Center(
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
                    }
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
              const Text('직업 선택'),
              const SizedBox(
                height: 5,
              ),
              ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedJobList.length; i++) {
                      _selectedJobList[i] = i == index;
                    }
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
              const SizedBox(height: 10),
              const Text('목표 돈'),
              const SizedBox(height: 5),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '목표 금액을 입력하세요',
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
