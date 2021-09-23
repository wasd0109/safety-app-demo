import 'package:demo/cubit/auth_cubit.dart';
import 'package:demo/models/firebase_auth_provider.dart';
import 'package:demo/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static String route = "auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Map<String, dynamic> error = {};

  void validateInput(String email, String password) {
    if (email.isEmpty)
      error["email"] = AppLocalizations.of(context).required;
    else if (!EmailValidator.validate(email))
      error["email"] = "Please enter valid email";
    if (password.isEmpty)
      error["password"] = AppLocalizations.of(context).required;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).login),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: Column(
          children: [
            Image.asset(
              "images/kl-logo.png",
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autocorrect: false,
              controller: _email,
              decoration: kTextInputStyle.copyWith(
                labelText: AppLocalizations.of(context).email,
                errorText: error["email"],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autocorrect: false,
              obscureText: true,
              controller: _password,
              decoration: kTextInputStyle.copyWith(
                labelText: AppLocalizations.of(context).password,
                errorText: error["password"],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(
                  () {
                    error = {};
                    validateInput(_email.text.trim(), _password.text.trim());
                  },
                );

                if (error.isEmpty) {
                  BlocProvider.of<AuthCubit>(context)
                      .login(_email.text, _password.text);
                }
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
              child: Text(AppLocalizations.of(context).login),
            )
          ],
        ),
      ),
    );
  }
}
