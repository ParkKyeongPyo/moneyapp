import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NicknameWidget extends StatefulWidget {
  const NicknameWidget({super.key});

  @override
  State<NicknameWidget> createState() => _NicknameWidgetState();
}

class _NicknameWidgetState extends State<NicknameWidget> {
  String nickname = "";
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            tooltip: 'Return',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("닉네임 설정"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("닉네임"),
              const SizedBox(
                height: 5,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '원하는 닉네임을 입력해주세요',
                ),
                onChanged: (value) {
                  setState(() {
                    nickname = value;
                  });
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("닉네임 변경 후 30일간 변경할 수 없습니다."),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  if (user != null) {
                    user?.updateDisplayName(nickname);
                  }

                  Navigator.pop(context);
                },
                child: const Text("닉네임 변경"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
