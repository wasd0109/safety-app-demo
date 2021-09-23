import 'package:flutter/material.dart';

const kTextInputStyle = InputDecoration(
  border: OutlineInputBorder(),
);

const kAddWarningLabelStyle = TextStyle(
  fontSize: 20,
  color: Colors.black54,
);

final kRoundedRectangleButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  ),
);
