import 'package:flutter/material.dart';
import 'package:moneyapp/appbar_route/profile_widget/login_logic_widget.dart';
import 'package:moneyapp/appbar_route/profile_widget/nickname_widget.dart';

import 'profile_widget/login_screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool isLoggin = false;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //로그인 상태 담긴 변수

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    setState(() {
      //isLoggin = FirebaseUserWidget.isLogginFunction(isLoggin);
      FirebaseAuth.instance.authStateChanges().listen(
        (User? user) {
          if (user != null) {
            isLoggin = true;
          } else {
            isLoggin = false;
          }
        },
      );
    });

    print(isLoggin);

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
          title: const Text("설정"),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth - 26,
                child: isLoggin
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("내 정보"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NicknameWidget(),
                                ),
                              );
                            },
                            child: const Text("닉네임 설정"),
                          ),
                        ],
                      )
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text("로그인"),
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth - 26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("계정"),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth - 26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("앱 정보"),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth - 26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("기타"),
                    const SizedBox(
                      height: 5,
                    ),
                    isLoggin
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                LoginLogicWidget.logout();
                                isLoggin = false;
                              });
                            },
                            child: const Text("로그아웃"),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
