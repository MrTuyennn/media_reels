import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_event.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_state.dart';
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
            if (BlocProvider.of<ThemeBloc>(context).state.themeMode ==
                ThemeModeLM.light) {
              context
                  .read<ThemeBloc>()
                  .add(ChangeThemeMode(themeMode: ThemeModeLM.dark));
            } else {
              context
                  .read<ThemeBloc>()
                  .add(ChangeThemeMode(themeMode: ThemeModeLM.light));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Theme.of(context).colorScheme.surface,
              ),
              Container(
                height: 100,
                width: 100,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
