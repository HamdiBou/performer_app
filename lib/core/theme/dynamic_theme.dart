import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/conference/domain/providers/conference_provider.dart';

final dynamicThemeProvider = Provider<ThemeData>((ref) {
  final selectedConference = ref.watch(conferenceProvider);

  Color primaryColor = Colors.blue; // Default fallback

  if (selectedConference != null) {
    final hexCode = selectedConference.primaryColorHex.replaceAll('#', '');
    if (hexCode.length == 6 || hexCode.length == 8) {
      primaryColor = Color(int.parse('FF$hexCode', radix: 16));
    }
  }

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
  );
});
