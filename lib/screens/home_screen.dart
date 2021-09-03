import 'package:demo/screens/add_warning_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/components/drawer_content.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddWarningScreen.route);
        },
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: DrawerContent("Home"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning,
                color: Colors.black26,
                size: 100,
              ),
              Text(
                "No warning",
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
