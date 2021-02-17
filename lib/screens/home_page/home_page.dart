import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:num_cluster/colors.dart';
import 'package:num_cluster/screens/home_page/components/drawer.dart';
import 'package:num_cluster/screens/home_page/components/drawer_button.dart';
import 'package:num_cluster/screens/home_page/components/matrix_input.dart';
import 'package:num_cluster/screens/home_page/components/matrix_input_button.dart';
import 'package:num_cluster/screens/solution_page/solution_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMatrixInputVisible = false;

  Map<String, bool> drawerValues = {
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

    return Scaffold(
      drawer: CustomDrawer(
        drawerValues: drawerValues,
        button1Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Addition'] = true;
          },
        ),
        button2Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Subtraction'] = true;
          },
        ),
        button3Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Product'] = true;
          },
        ),
        button4Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Transpose'] = true;
          },
        ),
        button5Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Adjoint'] = true;
          },
        ),
        button6Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Determinant'] = true;
          },
        ),
        button7Tap: () => setState(
          () {
            for (int a = 0; a < drawerValues.length; a++) {
              drawerValues[drawerValues.keys.toList()[a]] = false;
            }

            drawerValues['Inverse'] = true;
          },
        ),
      ),
      backgroundColor: CustomColors.whiteColor,
      body: Stack(
        children: [
          SafeArea(
            left: false,
            right: false,
            bottom: false,
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
                const SizedBox(height: 30),
                MatrixInputButton(
                  text: 'Input Matrix A',
                  onTap: () => setState(() {
                    isMatrixInputVisible = !isMatrixInputVisible;
                  }),
                ),
                const SizedBox(height: 30),
                MatrixInputButton(
                  text: 'Input Matrix B',
                  hasBorder: true,
                  onTap: () => setState(() {
                    isMatrixInputVisible = !isMatrixInputVisible;
                  }),
                ),
                const SizedBox(height: 60),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    width: size.width,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        DottedBorder(
                          color: CustomColors.whiteColor,
                          dashPattern: [5, 7],
                          strokeWidth: 4,
                          radius: Radius.circular(20),
                          borderType: BorderType.RRect,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 100,
                              width: size.width * 0.9,
                              child: Center(
                                child: Text(
                                  drawerValues.keys.toList()[drawerValues.values.toList().indexOf(true)],
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: CustomColors.whiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 100,
                          width: size.width * 0.85,
                          decoration: BoxDecoration(
                            color: CustomColors.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 4, color: CustomColors.whiteColor),
                          ),
                          child: Material(
                            color: CustomColors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SolutionPage(),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Calculate',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: CustomColors.whiteColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MatrixInput(
            isVisible: isMatrixInputVisible,
            donePressed: () => setState(() => isMatrixInputVisible = !isMatrixInputVisible),
          ),
        ],
      ),
    );
  }
}
