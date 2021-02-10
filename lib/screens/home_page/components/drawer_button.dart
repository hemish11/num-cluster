import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () => Scaffold.of(context).openDrawer(),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    width: 40,
                    decoration: BoxDecoration(
                      color: CustomColors.blackColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    height: 6,
                    width: 35,
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    height: 6,
                    width: 40,
                    decoration: BoxDecoration(
                      color: CustomColors.blackColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
