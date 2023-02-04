import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          title: const Text("Profile"),
        ),
        body: const Text("Profile"),
      ),
    );
  }
}
