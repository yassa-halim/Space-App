import 'package:flutter/material.dart';
import 'package:spec/app_assets.dart';
import 'package:spec/app_colors.dart';
import 'package:spec/app_text_styles.dart';
import 'package:spec/home_screen.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = '/start-screen';
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(AppImages.onBoarding),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Explore\nThe\nUniverse',
                style: AppTextStyles.headLine,
              ),
            ),
          ),
          Align(
            alignment: .bottomCenter,
            child: CustomExploreButton(
              text: 'Explore',
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}