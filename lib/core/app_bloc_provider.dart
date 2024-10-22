import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/bloc/index.dart';

class AppBlocProvider extends StatefulWidget {
  const AppBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  State<AppBlocProvider> createState() => _AppBlocProviderState();
}

class _AppBlocProviderState extends State<AppBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => LocaleBloc(),
        ),
        BlocProvider<ReelsBloc>(
          create: (context) => ReelsBloc(),
        ),
      ],
      child: widget.child,
    );
  }
}
