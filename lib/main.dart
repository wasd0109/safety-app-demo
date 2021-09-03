import 'package:demo/main_stack.dart';
import 'package:demo/models/firebase_auth_provider.dart';
import 'package:demo/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => FirebaseAuthProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('ja', ''), // Spanish, no country code
        ],
        title: 'Flutter Demo',
        initialRoute: AuthScreen.route,
        routes: {
          MainStack.route: (context) => MainStack(),
          AuthScreen.route: (context) => AuthScreen(),
        },
      ),
    );
  }
}
