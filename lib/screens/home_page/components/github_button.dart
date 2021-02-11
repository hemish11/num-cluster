import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:num_cluster/colors.dart';

class ExitButton extends StatelessWidget {
  const ExitButton();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 80,
      width: size.width * 0.66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: CustomColors.primaryColor, width: 2),
      ),
      child: Material(
        color: CustomColors.transparent,
        child: InkWell(
          onTap: () => exit(0),
          borderRadius: BorderRadius.circular(40),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(FeatherIcons.x, size: 34),
              const SizedBox(width: 30),
              const Text(
                'Exit',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
