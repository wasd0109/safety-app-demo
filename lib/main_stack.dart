import 'package:demo/screens/add_warning_screen.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/setting_screen.dart';
import 'package:demo/screens/add_warning_screen.dart';
import 'package:flutter/material.dart';

class MainStack extends StatefulWidget {
  static String route = "main";
  const MainStack({Key? key}) : super(key: key);

  @override
  _MainStackState createState() => _MainStackState();
}

class _MainStackState extends State<MainStack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        SettingScreen.route: (context) => SettingScreen(),
        AddWarningScreen.route: (context) => AddWarningScreen(),
      },
    );
  }
}
