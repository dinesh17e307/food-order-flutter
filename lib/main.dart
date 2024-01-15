import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/Screens/Categories.dart';
import 'package:foodorder/Screens/Tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodorder/Screens/MealsScreen.dart';

import 'package:foodorder/data/dummy_data.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(188, 182, 106, 7),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
