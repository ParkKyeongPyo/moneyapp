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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static dynamic signWithEmailAndPassword(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const AlertDialog(
          title: Text("Alert Dialog Title"),
          content: Text("This is an alert dialog. Click OK to dismiss."),
        );
        print('Wrong password provided for that user.');
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
