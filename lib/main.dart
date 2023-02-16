import 'package:flutter/material.dart';
import 'package:moneyapp/route/home_screen.dart';
import 'package:moneyapp/route/info_screen.dart';

import 'appbar_route/edit_screen.dart';
import 'package:moneyapp/appbar_route/profile_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'fun_widget/dialog_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  // bottom navigation bar variable and function.
  static int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //User 정보 변수
  static String userID = "";
  static String? userEmail = "";
  static String? displayname = "";

  //로그인 상태 변수
  static bool isLoggin = true;

  //String _value = "";
  //bool _isChildUpdated = false;

  /*void _update(String value) {
    setState(() {
      _isChildUpdated = true;
      _value = value;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        userID = user.uid;
        userEmail = user.email;
        displayname = user.displayName;
        isLoggin = true;
      } else {
        isLoggin = false;
      }
    });

    List<Widget> pages = <Widget>[
      const HomeScreen(),
      const InfoScreen(),
    ];

    print(userID);
    print(userEmail);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text("돈모아"),
              isLoggin ? Text('$displayname') : const Text(""),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: () {
                if (isLoggin) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        userID: userID,
                        userEmail: userEmail,
                      ),
                    ),
                  );
                } else {
                  DialogWidget.showDialogAlert(
                    context: context,
                    title: "알림",
                    message: "로그인 후 이용할 수 있습니다.",
                  );
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: '정보',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
