import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ContainerWithText extends StatelessWidget {
  final String heading;
  final List<String> containerText;
  final bool darkMode;

  const ContainerWithText({
    required this.heading,
    required this.containerText,
    required this.darkMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              heading,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.getSecondaryColor(darkMode),
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.getAccentColor(darkMode)),
            ),
          ],
        ),
        const Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 5.0)),
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: screenHeight * 0.25,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                color: AppColors.getSecondaryColor(darkMode),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.getShadowColor(darkMode),
                      spreadRadius: 3,
                      blurRadius: 3),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: containerText.map((String text) {
                  return Text(
                    text,
                    style: TextStyle(color: AppColors.getTextColor(darkMode)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
