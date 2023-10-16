import 'package:flutter/material.dart';
import 'package:plant_app/screens/intro_screen.dart';
import 'package:plant_app/utils/base_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant shop app ui',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BaseColor.green),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: BaseColor.backgroundWhite,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: BaseColor.black,
          ),
          centerTitle: true,
        ),
      ),
      home: const IntroScreen(),
    );
  }
}
