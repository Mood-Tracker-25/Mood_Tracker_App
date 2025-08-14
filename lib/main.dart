import 'package:flutter/material.dart';
import 'package:mood_tracker/settings_page.dart';
import 'home_screen.dart';
import 'insights_page.dart';
import 'mood_input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/mymood': (context) => MoodInputScreen(),
        '/insights': (context) => InsightsPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}