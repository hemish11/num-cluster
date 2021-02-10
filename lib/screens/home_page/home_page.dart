import 'package:flutter/material.dart';
import 'package:num_cluster/screens/home_page/components/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
