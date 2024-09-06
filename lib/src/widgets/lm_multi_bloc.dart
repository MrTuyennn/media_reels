import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/src/bloc/index.dart';

class LmMultiBloc extends StatefulWidget {
  const LmMultiBloc({super.key, required this.child});

  final Widget child;

  @override
  State<LmMultiBloc> createState() => _LmMultiBlocState();
}

class _LmMultiBlocState extends State<LmMultiBloc> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ThemeBloc>(create: (BuildContext context) => ThemeBloc()),
    ], child: widget.child);
  }
}
