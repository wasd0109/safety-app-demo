import 'package:demo/cubit/auth_cubit.dart';
import 'package:demo/models/firebase_auth_provider.dart';
import 'package:demo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DrawerContent extends StatelessWidget {
  final String currentRoute;

  DrawerContent(this.currentRoute);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is AuthLoggedIn) {
            final user = state.user;
            return UserAccountsDrawerHeader(
              accountEmail: Text(user.email ?? "Not avaliable"),
              accountName: Text(user.displayName ?? "Not avaliable"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  getInitials(user.displayName),
                  style: TextStyle(fontSize: 30),
                ),
              ),
            );
          }
          return Center(
            child: Text("Error"),
          );
        }),
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
