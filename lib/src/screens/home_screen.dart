import 'package:flutter/material.dart';
import 'package:media_reels/src/models/user/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            final jsonData = {
              "FIRST_NAME": "Nguyễn Ngọc Tuyên 123",
              "LAST_NAME": "Phàm Phàm 123",
              "IS_ACTIVE": false
            };
            user = User.fromJson(jsonData);
            print(user!.toJson());
            print(user);
            user!.updateUser();
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
