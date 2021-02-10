import 'package:flutter/material.dart';
import 'package:num_cluster/screens/home_page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Num Cluster',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
