import 'package:demo/components/platform_dropdown_button.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:demo/models/add_warning_enum.dart';

class AddWarningScreen extends StatefulWidget {
  static String route = "/add-warning";
  const AddWarningScreen({Key? key}) : super(key: key);

  @override
  _AddWarningScreenState createState() => _AddWarningScreenState();
}

class _AddWarningScreenState extends State<AddWarningScreen> {
  WarningColor warningColor = WarningColor.yellow;
  Situations situation = Situations.fire;
  Locations location = Locations.room420;
  TextEditingController _situationText = TextEditingController();
  TextEditingController _locationText = TextEditingController();

  void handleWarningColorChange(WarningColor color) {
    setState(() {
      warningColor = color;
    });
  }

  String situationToString(Situations situation) {
    return situation.toString().split(".")[1];
  }

  String locationToString(Locations location) {
    return location.toString().split(".")[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Warning",
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Color",
              style: kAddWarningLabelStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    handleWarningColorChange(WarningColor.yellow);
                  },
                  elevation: 0,
                  color: warningColor == WarningColor.yellow
                      ? Colors.yellow
                      : Colors.yellow.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(99),
                      bottomLeft: Radius.circular(99),
                    ),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    handleWarningColorChange(WarningColor.red);
                  },
                  color: warningColor == WarningColor.red
                      ? Colors.red
                      : Colors.red.withOpacity(0.3),
                ),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    handleWarningColorChange(WarningColor.black);
                  },
                  color: warningColor == WarningColor.black
                      ? Colors.black
                      : Colors.black.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(99),
                      bottomRight: Radius.circular(99),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Situation",
              style: kAddWarningLabelStyle,
            ),
            Center(
                child: DropdownButton(
              value: situation,
              items: Situations.values
                  .map(
                    (Situations situation) => DropdownMenuItem(
                      value: situation,
                      child: Text(
                        situationToString(situation),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (Situations? situation) {
                setState(() {
                  if (situation != null) this.situation = situation;
                });
              },
            )),
            if (situation == Situations.others)
              TextField(
                controller: _situationText,
                decoration: kTextInputStyle.copyWith(
                  hintText: "Enter situation",
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Location",
              style: kAddWarningLabelStyle,
            ),
            Center(
              child: DropdownButton(
                value: location,
                onChanged: (Locations? location) {
                  setState(() {
                    if (location != null) this.location = location;
                  });
                },
                items: Locations.values
                    .map(
                      (location) => DropdownMenuItem(
                        value: location,
                        child: Text(
                          locationToString(location),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            if (location == Locations.others)
              TextField(
                controller: _locationText,
                decoration:
                    kTextInputStyle.copyWith(hintText: "Enter location"),
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: kRoundedRectangleButtonStyle,
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                OutlinedButton(
                  style: kRoundedRectangleButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
