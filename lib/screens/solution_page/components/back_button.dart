import 'dart:math';

import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: CustomColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.pop(context),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 6,
                        width: 30,
                        decoration: BoxDecoration(
                          color: CustomColors.primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: Offset(-3, -6),
                        child: Transform.rotate(
                          angle: -pi / 4,
                          child: Container(
                            height: 6,
                            width: 20,
                            decoration: BoxDecoration(
                              color: CustomColors.blackColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: Offset(-3, 6),
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                            height: 6,
                            width: 20,
                            decoration: BoxDecoration(
                              color: CustomColors.blackColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
