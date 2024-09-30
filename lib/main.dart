import 'package:flutter/material.dart';
import 'package:media_reels/app_provider.dart';
import 'package:media_reels/core/log/log.dart';

void main() {
  Log.init();
  runApp(const AppProvider());
}
