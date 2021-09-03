import 'package:demo/models/firebase_auth_provider.dart';
import 'package:demo/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerContent extends StatelessWidget {
  String currentRoute;

  DrawerContent(this.currentRoute);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Consumer<FirebaseAuthProvider>(
          builder: (_, authProvider, __) => UserAccountsDrawerHeader(
            accountEmail: Text(authProvider.getEmail() ?? "Not logged in"),
            accountName: Text(authProvider.getUsername() ?? "Not logged in"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                authProvider.getInitials(),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pushNamed(context, '/setting');
          },
        ),
        ListTile(
          onTap: () {
            Provider.of<FirebaseAuthProvider>(context, listen: false)
                .firebaseAuth
                .signOut();
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
        ),
      ],
    );
  }
}
