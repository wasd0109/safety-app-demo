import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class SettingScreen extends StatefulWidget {
  static String route = "/setting";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool enableNotification = true;

  void toggleNotificationSetting(bool newSetting) {
    setState(() {
      enableNotification = newSetting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Enable notification"),
              trailing: Platform.isIOS
                  ? CupertinoSwitch(
                      value: enableNotification,
                      onChanged: toggleNotificationSetting)
                  : Switch(
                      value: enableNotification,
                      onChanged: toggleNotificationSetting),
            )
          ],
        ));
  }
}
