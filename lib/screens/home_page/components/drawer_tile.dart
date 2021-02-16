import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';

class DrawerTile extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final bool isSelected;

  const DrawerTile({Key key, @required this.text, this.onTap, @required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      height: 70,
      width: size.width * 0.66,
      margin: const EdgeInsets.symmetric(vertical: 8),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? CustomColors.blackColor : CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Material(
        color: CustomColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(35),
          onTap: onTap,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? CustomColors.whiteColor : CustomColors.blackColor,
                ),
                duration: const Duration(milliseconds: 300),
                child: Text(
                  text,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
