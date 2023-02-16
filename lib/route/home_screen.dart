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

  //late bool isUpdated;

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getUserDataFromFB() async {
    if (HomeScreen.userID != "") {
      final docRef = db.collection("UserData").doc(HomeScreen.userID);
      try {
        final DocumentSnapshot doc = await docRef.get();
        final data = doc.data() as Map<String, dynamic>;

        if (data['target'] == "있음") {
          if (data['job'] == '직장인' || data['job'] == '알바생') {
            HomeScreen.info['currentMoney'] = data['currentMoney'];
            HomeScreen.info['targetMoney'] = data['targetMoney'];
            HomeScreen.info['targetPeriod'] = data['targetPeriod'];
            HomeScreen.info['salary'] = data['salary'];
            HomeScreen.info['addIncome'] = data['addIncome'];
            HomeScreen.info['fixPay'] = data['fixPay'];
            HomeScreen.info['addPay'] = data['addPay'];
            HomeScreen.info['job'] = data['job'];

            HomeScreen.info['category'] = 1;
            return HomeScreen.info;
          } else if (data['job'] == '프리랜서') {
            HomeScreen.info['currentMoney'] = data['currentMoney'];
            HomeScreen.info['targetMoney'] = data['targetMoney'];
            HomeScreen.info['targetPeriod'] = data['targetPeriod'];
            HomeScreen.info['income'] = data['income'];
            HomeScreen.info['addIncome'] = data['addIncome'];
            HomeScreen.info['fixPay'] = data['fixPay'];
            HomeScreen.info['addPay'] = data['addPay'];
            HomeScreen.info['job'] = data['job'];

            HomeScreen.info['category'] = 2;
            return HomeScreen.info;
          } else {
            HomeScreen.info['currentMoney'] = data['currentMoney'];
            HomeScreen.info['targetMoney'] = data['targetMoney'];
            HomeScreen.info['targetPeriod'] = data['targetPeriod'];
            HomeScreen.info['pinMoney'] = data['pinMoney'];
            HomeScreen.info['monthPay'] = data['monthPay'];
            HomeScreen.info['job'] = data['job'];

            HomeScreen.info['category'] = 3;
            return HomeScreen.info;
          }
        } else {
          if (data['job'] == '직장인' || data['job'] == '알바생') {
            HomeScreen.info['currentMoney'] = data['currentMoney'];
            HomeScreen.info['salary'] = data['salary'];
            HomeScreen.info['addIncome'] = data['addIncome'];
            HomeScreen.info['fixPay'] = data['fixPay'];
            HomeScreen.info['addPay'] = data['addPay'];
            HomeScreen.info['job'] = data['job'];

            HomeScreen.info['category'] = 4;
            return HomeScreen.info;
          } else if (data['job'] == '프리랜서') {
            HomeScreen.info['currentMoney'] = data['currentMoney'];
            HomeScreen.info['income'] = data['income'];
            HomeScreen.info['addIncome'] = data['addIncome'];
            HomeScreen.info['fixPay'] = data['fixPay'];
            HomeScreen.info['addPay'] = data['addPay'];
            HomeScreen.info['job'] = data['job'];

            HomeScreen.info['category'] = 5;
            return HomeScreen.info;
          } else {
            HomeScreen.info['currentMoney'] = data['currentMoney'];
            HomeScreen.info['pinMoney'] = data['pinMoney'];
            HomeScreen.info['monthPay'] = data['monthPay'];
            HomeScreen.info['job'] = data['job'];

            HomeScreen.info['category'] = 6;
            return HomeScreen.info;
          }
        }
        // ...
      } catch (e) {
        print("Error getting document: $e");
        return HomeScreen.info;
      }
    } else {
      return HomeScreen.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    /*if (widget.isUpdated) {
      setState(() {
        widget.isUpdated = false;
      });
    }*/

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        HomeScreen.userID = user.uid;
      } else {
        HomeScreen.userID = "";
      }
    });

    getUserDataFromFB();

    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: getUserDataFromFB(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is not yet complete, show a loading spinner
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              // If the Future is complete and has data, show the data
              print("hasData");
              print(snapshot.data);
              return Center(
                child: HomeScreen.userID != ""
                    ? HomeScreen.info['category'] == 1
                        ? TargetCompany(
                            info: HomeScreen.info,
                          )
                        : HomeScreen.info['category'] == 2
                            ? TargetFree(
                                info: HomeScreen.info,
                              )
                            : HomeScreen.info['category'] == 3
                                ? TargetStudent(
                                    info: HomeScreen.info,
                                  )
                                : HomeScreen.info['category'] == 4
                                    ? Company(
                                        info: HomeScreen.info,
                                      )
                                    : HomeScreen.info['category'] == 5
                                        ? Free(
                                            info: HomeScreen.info,
                                          )
                                        : HomeScreen.info['category'] == 6
                                            ? Student(
                                                info: HomeScreen.info,
                                              )
                                            : const Text("정보를 먼저 작성해주세요.")
                    : const Text("로그인 후 이용하세요"),
              );
            }
            if (snapshot.hasError) {
              // If the Future has an error, display the error message
              return Text("Error: ${snapshot.error}");
            }
            // By default, show a loading spinner
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
