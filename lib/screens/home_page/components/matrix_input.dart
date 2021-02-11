import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';

class MatrixInput extends StatelessWidget {
  final bool isVisible;
  final GestureTapCallback donePressed;

  const MatrixInput({Key key, this.isVisible = false, this.donePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: IgnorePointer(
        ignoring: !isVisible,
        child: Container(
          height: size.height,
          width: size.width,
          color: CustomColors.blackColor.withAlpha(140),
          child: Center(
            child: Container(
              height: 380,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 70,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: CustomColors.primaryColor),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Enter Matrix'),
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Note: Separate each value of matrix by comma'),
                  const Spacer(),
                  Row(children: [
                    const SizedBox(width: 20),
                    Counter(title: 'Rows'),
                    const Spacer(),
                    Counter(title: 'Columns'),
                    const SizedBox(width: 20),
                  ]),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 70,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: CustomColors.primaryColor),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Material(
                          color: CustomColors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(35),
                            onTap: donePressed,
                            child: Center(
                              child: Text('Done', style: TextStyle(fontSize: 26, color: CustomColors.blackColor)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String title;

  const Counter({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.3,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Divider(
            height: 10,
            color: CustomColors.primaryColor,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: CustomColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.exposure_minus_1,
                  size: 28,
                  color: CustomColors.primaryColor,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: CustomColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.exposure_plus_1,
                  size: 28,
                  color: CustomColors.primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
