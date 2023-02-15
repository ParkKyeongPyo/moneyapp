import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyapp/route/home_screen_widgets/student.dart';
import 'package:moneyapp/route/home_screen_widgets/target_company.dart';
import 'package:moneyapp/route/home_screen_widgets/target_student.dart';

import 'home_screen_widgets/company.dart';
import 'home_screen_widgets/free.dart';
import 'home_screen_widgets/target_free.dart';

class HomeScreen extends StatefulWidget {
  static String userID = "";

  static String target = "있음";
  static String job = "직장인";
  static int currentMoney = 0;
  static int targetMoney = 0;
  static int targetPeriod = 0;
  static int salary = 0;
  static int addIncome = 0;
  static int fixPay = 0;
  static int addPay = 0;

//freelancer
  static int income = 0;

//student
  static int pinMoney = 0;
  static int monthPay = 0;

  static int category = 0;

  static Map<String, dynamic> info = {};

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        HomeScreen.userID = user.uid;
      }
    });

    if (HomeScreen.userID != "") {
      final docRef = db.collection("UserData").doc(HomeScreen.userID);
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);

          if (data['target'] == "있음") {
            if (data['job'] == '직장인' || data['job'] == '알바생') {
              HomeScreen.info['currentMoney'] = data['currentMoney'];
              HomeScreen.info['targetMoney'] = data['targetMoney'];
              HomeScreen.info['targetPeriod'] = data['targetPeriod'];
              HomeScreen.info['salary'] = data['salary'];
              HomeScreen.info['addIncome'] = data['addIncome'];
              HomeScreen.info['fixPay'] = data['fixPay'];
              HomeScreen.info['addPay'] = data['addPay'];

              HomeScreen.category = 1;
            } else if (data['job'] == '프리랜서') {
              HomeScreen.info['currentMoney'] = data['currentMoney'];
              HomeScreen.info['targetMoney'] = data['targetMoney'];
              HomeScreen.info['targetPeriod'] = data['targetPeriod'];
              HomeScreen.info['income'] = data['income'];
              HomeScreen.info['addIncome'] = data['addIncome'];
              HomeScreen.info['fixPay'] = data['fixPay'];
              HomeScreen.info['addPay'] = data['addPay'];

              HomeScreen.category = 2;
            } else {
              HomeScreen.info['currentMoney'] = data['currentMoney'];
              HomeScreen.info['targetMoney'] = data['targetMoney'];
              HomeScreen.info['targetPeriod'] = data['targetPeriod'];
              HomeScreen.info['pinMoney'] = data['pinMoney'];
              HomeScreen.info['monthPay'] = data['monthPay'];

              HomeScreen.category = 3;
            }
          } else {
            if (data['job'] == '직장인' || data['job'] == '알바생') {
              HomeScreen.info['currentMoney'] = data['currentMoney'];
              HomeScreen.info['salary'] = data['salary'];
              HomeScreen.info['addIncome'] = data['addIncome'];
              HomeScreen.info['fixPay'] = data['fixPay'];
              HomeScreen.info['addPay'] = data['addPay'];

              HomeScreen.category = 4;
            } else if (data['job'] == '프리랜서') {
              HomeScreen.info['currentMoney'] = data['currentMoney'];
              HomeScreen.info['income'] = data['income'];
              HomeScreen.info['addIncome'] = data['addIncome'];
              HomeScreen.info['fixPay'] = data['fixPay'];
              HomeScreen.info['addPay'] = data['addPay'];

              HomeScreen.category = 5;
            } else {
              HomeScreen.info['currentMoney'] = data['currentMoney'];
              HomeScreen.info['pinMoney'] = data['pinMoney'];
              HomeScreen.info['monthPay'] = data['monthPay'];

              HomeScreen.category = 6;
            }
          }
          // ...
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeScreen.userID != ""
              ? HomeScreen.category == 1
                  ? TargetCompany(
                      info: HomeScreen.info,
                    )
                  : HomeScreen.category == 2
                      ? TargetFree(
                          info: HomeScreen.info,
                        )
                      : HomeScreen.category == 3
                          ? TargetStudent(
                              info: HomeScreen.info,
                            )
                          : HomeScreen.category == 4
                              ? Company(
                                  info: HomeScreen.info,
                                )
                              : HomeScreen.category == 5
                                  ? Free(
                                      info: HomeScreen.info,
                                    )
                                  : HomeScreen.category == 6
                                      ? Student(
                                          info: HomeScreen.info,
                                        )
                                      : const Text("정보를 먼저 작성해주세요.")
              : const Text("로그인 후 이용하세요"),
        ),
      ),
    );
  }
}
