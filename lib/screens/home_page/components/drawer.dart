import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';
import 'package:num_cluster/screens/home_page/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Container(
        width: size.width * 0.75,
        margin: EdgeInsets.only(
          bottom: 20.0,
          left: 20.0,
          top: MediaQuery.of(context).padding.top == 0 ? 20.0 : 0,
        ),
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Num Cluster',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: CustomColors.primaryColor),
            ),
            const SizedBox(height: 30),
            DrawerTile(text: 'Addition', isSelected: false),
            DrawerTile(text: 'Subtraction', isSelected: false),
            DrawerTile(text: 'Product', isSelected: false),
            DrawerTile(text: 'Transpose', isSelected: true),
            DrawerTile(text: 'Adjoint', isSelected: false),
            DrawerTile(text: 'Determinant', isSelected: false),
            DrawerTile(text: 'Inverse', isSelected: false),
          ],
        ),
      ),
    );
  }
}
