import 'package:flutter/material.dart';

class AddWarningScreen extends StatelessWidget {
  static String route = "/add-warning";
  const AddWarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Warning"),
      ),
    );
  }
}
