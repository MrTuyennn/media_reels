import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/src/bloc/index.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_state.dart';
import 'package:media_reels/src/screens/home_screen.dart';
import 'package:media_reels/src/theme/theme_app.dart';
import 'package:media_reels/src/widgets/lm_multi_bloc.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  Widget build(BuildContext context) {
    return LmMultiBloc(child:
        BlocBuilder<ThemeBloc, ThemeState>(builder: (context, stateTheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: stateTheme.themeMode == ThemeModeLM.light
            ? kLightTheme
            : kDarkTheme,
        home: const HomeScreen(),
      );
    }));
  }
}
