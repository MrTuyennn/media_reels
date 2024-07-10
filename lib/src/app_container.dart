import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:media_reels/src/models/user/user.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  User? user;
  User? user2;
  @override
  void initState() {
    super.initState();
    user = const User(firstName: "Nguyễn Ngọc Tuyên", lastName: "Phàm Phàm");
    user2 = const User(firstName: "Nguyễn Ngọc Tuyên", lastName: "Phàm Phàm");

    // final body = jsonEncode();
    print(user!.toJson());
    print(User.fromJson(user!.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child: Text(user!.isActive ? "active" : "unactive"),
          ),
        ),
      ),
    );
  }
}
