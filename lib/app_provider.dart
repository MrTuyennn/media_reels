import 'package:flutter/material.dart';
import 'package:media_reels/core/app_bloc_provider.dart';
import 'package:media_reels/core/app_container.dart';

class AppProvider extends StatefulWidget {
  const AppProvider({super.key});

  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  @override
  Widget build(BuildContext context) {
    return const AppBlocProvider(child: AppContainer());
  }
}
