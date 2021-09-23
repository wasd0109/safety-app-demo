import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformDropdownButton extends StatelessWidget {
  final dynamic enums;
  final dynamic onChanged;
  final dynamic value;

  PlatformDropdownButton(
      {required this.enums, required this.onChanged, required this.value});

  String enumsToString(dynamic enumsItem) {
    return enumsItem.toString().split(".")[1];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      onChanged: onChanged,
      items: enums.values
          .map(
            (situation) => DropdownMenuItem(
              value: situation,
              child: Text(
                enumsToString(situation),
              ),
            ),
          )
          .toList(),
    );
  }
}
