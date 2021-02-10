import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:num_cluster/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubButton extends StatelessWidget {
  const GithubButton();

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
          onTap: () async {
            String githubUrl = 'https://github.com/hemish11/num-cluster';

            if (await canLaunch(githubUrl)) {
              await launch(githubUrl);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
          borderRadius: BorderRadius.circular(40),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(FeatherIcons.github, size: 34),
              const SizedBox(width: 30),
              const Text(
                'Github',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
