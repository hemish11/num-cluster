import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';
import 'package:num_cluster/screens/home_page/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final Map<String, bool> drawerValues;
  final GestureTapCallback button1Tap;
  final GestureTapCallback button2Tap;
  final GestureTapCallback button3Tap;
  final GestureTapCallback button4Tap;
  final GestureTapCallback button5Tap;
  final GestureTapCallback button6Tap;
  final GestureTapCallback button7Tap;

  const CustomDrawer({
    Key key,
    this.drawerValues,
    this.button1Tap,
    this.button2Tap,
    this.button3Tap,
    this.button4Tap,
    this.button5Tap,
    this.button6Tap,
    this.button7Tap,
  }) : super(key: key);

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
            for (int i = 0; i < drawerValues.length; i++)
              DrawerTile(
                text: drawerValues.keys.toList()[i],
                isSelected: drawerValues.values.toList()[i],
                onTap: () {
                  switch (i) {
                    case 0:
                      button1Tap();
                      break;
                    case 1:
                      button2Tap();
                      break;
                    case 2:
                      button3Tap();
                      break;
                    case 3:
                      button4Tap();
                      break;
                    case 4:
                      button5Tap();
                      break;
                    case 5:
                      button6Tap();
                      break;
                    case 6:
                      button7Tap();
                      break;
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
