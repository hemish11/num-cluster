import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';
import 'package:num_cluster/screens/home_page/components/drawer.dart';
import 'package:num_cluster/screens/home_page/components/drawer_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const DrawerButton(),
                const Spacer(),
                Text(
                  'Num Cluster',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: CustomColors.primaryColor),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
