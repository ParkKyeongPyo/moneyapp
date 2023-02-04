import 'package:flutter/material.dart';
import 'package:moneyapp/route/home_screen.dart';
import 'package:moneyapp/route/info_screen.dart';
import 'package:moneyapp/route/rank_screen.dart';

import 'appbar_route/edit_screen.dart';
import 'appbar_route/profile_screen.dart';

void main() {
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    const InfoScreen(),
    const RankScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("moneyApp"),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_rounded),
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
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Rank',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
