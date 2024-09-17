import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:media_reels/bloc/index.dart';
import 'package:media_reels/core/app_routers.dart';
import 'package:media_reels/l10n/l10n.dart';
import 'package:media_reels/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // get state Locale App
      final stateLocale = context.watch<LocaleBloc>().state.locale;
      final stateMode = context.watch<ThemeBloc>().state.themeMode;
      print(stateMode);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: stateLocale,
        theme: kLightTheme,
        darkTheme: kDarkTheme,
        themeMode: stateMode,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: AppRouters.generateRoutes,
      );
    });
  }
}
