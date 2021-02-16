import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';
import 'package:num_cluster/screens/home_page/components/drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Map<String, bool> tileList = {
    'Addition': true,
    'Subtraction': false,
    'Product': false,
    'Transpose': false,
    'Adjoint': false,
    'Determinant': false,
    'Inverse': false
  };

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
            for (int i = 0; i < tileList.length; i++)
              DrawerTile(
                text: tileList.keys.toList()[i],
                isSelected: tileList.values.toList()[i],
                onTap: () => setState(
                  () {
                    for (int a = 0; a < tileList.length; a++) {
                      tileList[tileList.keys.toList()[a]] = false;
                    }

                    tileList[tileList.keys.toList()[i]] = true;
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
