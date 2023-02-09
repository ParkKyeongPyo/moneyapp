import 'package:flutter/material.dart';
import 'package:moneyapp/appbar_route/profile_widget/login_logic_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailAddress = "";
  String password = "";

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
          title: const Text("로그인"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일',
                ),
                onChanged: (value) {
                  setState(() {
                    emailAddress = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '계정 비밀번호',
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  LoginLogicWidget.signWithEmailAndPassword(
                    context,
                    emailAddress,
                    password,
                  );
                },
                child: const Text("로그인"),
              ),
              ElevatedButton(
                onPressed: () {
                  LoginLogicWidget.createUserWithEmailAndPassword(
                    emailAddress,
                    password,
                  );
                },
                child: const Text("새 계정 만들기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
