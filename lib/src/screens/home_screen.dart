import 'package:flutter/material.dart';
import 'package:media_reels/src/models/user/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  User? user2;
  @override
  void initState() {
    super.initState();
    user = const User(firstName: "Nguyễn Ngọc Tuyên", lastName: "Phàm Phàm");
    user2 = const User(firstName: "Nguyễn Ngọc Tuyên", lastName: "Phàm Phàm");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // final body = jsonEncode();
            print(user!.toJson());
            print(User.fromJson(user!.toJson()));
            user!.updateUser();
          },
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
