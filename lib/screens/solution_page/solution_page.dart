import 'package:flutter/material.dart';
import 'package:flutter_math/flutter_math.dart';
import 'package:num_cluster/colors.dart';
import 'package:num_cluster/screens/solution_page/components/back_button.dart';

class SolutionPage extends StatefulWidget {
  final List<String> steps;
  final String question;

  const SolutionPage({Key key, this.steps, this.question}) : super(key: key);

  @override
  _SolutionPageState createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                const CustomBackButton(),
                const Spacer(),
                Text(
                  'Solution',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: CustomColors.primaryColor),
                ),
                const SizedBox(width: 50),
              ],
            ),
            Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: CustomColors.primaryColor,
                  width: 5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Question',
                    style: TextStyle(
                      fontSize: 32,
                      color: CustomColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Math.tex(
                    widget.question,
                    textStyle: TextStyle(fontSize: 26),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: size.height * 0.47,
              width: size.width * 0.95,
              child: PageView.builder(
                itemCount: widget.steps.length,
                controller: _controller,
                onPageChanged: (value) => setState(() => currentIndex = value),
                itemBuilder: (context, index) => Container(
                  height: 150,
                  width: size.width * 0.9,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Step ${index + 1}',
                        style: TextStyle(fontSize: 30, color: CustomColors.whiteColor, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 25),
                      Math.tex(
                        widget.steps[index],
                        textStyle: TextStyle(fontSize: 26, color: CustomColors.whiteColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 10,
              width: (20 * widget.steps.length).toDouble(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: AnimatedContainer(
                    height: 10,
                    width: index == currentIndex ? 15 : 10,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: index == currentIndex ? CustomColors.primaryColor : CustomColors.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2, color: CustomColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Material(
                    color: CustomColors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        if (currentIndex != 0) {
                          setState(() {
                            currentIndex--;
                          });

                          _controller.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Previous',
                          style: TextStyle(fontSize: 20, color: CustomColors.whiteColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      width: 4,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  child: Material(
                    color: CustomColors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = widget.steps.length - 1;
                        });

                        _controller.animateToPage(
                          widget.steps.length - 1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear,
                        );
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Text(
                          'A',
                          style: TextStyle(fontSize: 28, color: CustomColors.blackColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Material(
                    color: CustomColors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        if (currentIndex != widget.steps.length - 1) {
                          setState(() {
                            currentIndex++;
                          });

                          _controller.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20, color: CustomColors.whiteColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
