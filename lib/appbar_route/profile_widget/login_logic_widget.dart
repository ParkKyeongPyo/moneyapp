import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginLogicWidget extends StatelessWidget {
  const LoginLogicWidget({super.key});

  static void createUserWithEmailAndPassword(emailAddress, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      var rnd = Random().nextInt(99999) + 1;
      await FirebaseAuth.instance.currentUser?.updateDisplayName('익명$rnd');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == "too-many-requests") {
        print('요청이 너무 많습니다. 잠시 후 로그인해주세요');
      }
    } catch (e) {
      print(e);
    }
  }

  static dynamic signWithEmailAndPassword(
      BuildContext context, String emailAddress, String password) async {
    try {
      //로그인 요청 코드
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      //로그인 성공시 코드
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text('Wrong password provided for that user.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text("뒤로가기"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        print('Wrong password provided for that user.');
      } else if (e.code == "too-many-requests") {
        print('요청이 너무 많습니다. 잠시 후 로그인해주세요');
      } else {
        print('다시 시도해주세요');
      }
    }
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
