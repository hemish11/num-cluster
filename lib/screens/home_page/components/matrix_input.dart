import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';

class MatrixInput extends StatelessWidget {
  final bool hasBorder;
  final String text;

  const MatrixInput({Key key, this.hasBorder = false, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: hasBorder ? CustomColors.whiteColor : CustomColors.primaryColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: hasBorder ? CustomColors.primaryColor : CustomColors.whiteColor,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 26,
            color: hasBorder ? CustomColors.blackColor : CustomColors.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
