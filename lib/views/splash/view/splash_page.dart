import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/bloc/index.dart';
import 'package:media_reels/environment.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              context.read<ThemeBloc>().add(const ThemeEvent.switchTheme());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(Environment.restApiUrl),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                ),
              ],
            )),
      ),
    );
  }
}
