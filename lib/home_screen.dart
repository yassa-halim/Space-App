import 'package:flutter/material.dart';
import 'package:spec/app_colors.dart';
import 'package:spec/app_text_styles.dart';
import 'package:spec/planet_details_screen.dart';
import 'package:spec/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const CustomMoonHeader(
            title: 'Explore',
            subTitle: 'Which planet\nwould you like to explore?',
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                currentPage = page;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/images/${Planet.planets[index].pngImage}',
                );
              },
              itemCount: Planet.planets.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: const CircleBorder(),
                    iconSize: 28,
                  ),
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  Planet.planets[currentPage].name,
                  style: AppTextStyles.bodyMeduim,
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: const CircleBorder(),
                    iconSize: 28,
                  ),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          CustomExploreButton(
            text: 'Explore ${Planet.planets[currentPage].name}',
            onPressed: () {
              Navigator.pushNamed(
                context,
                PlanetDetailsScreen.routeName,
                arguments: Planet.planets[currentPage],
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomMoonHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isDetailsScreen;

  const CustomMoonHeader({
    super.key,
    required this.title,
    required this.subTitle,
    this.isDetailsScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.halfMoon),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [Colors.transparent, AppColors.black],
                stops: const [0, .81],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyMeduim,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyles.bodyMeduim,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isDetailsScreen,
          child: SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: IconButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.white,
                shape: const CircleBorder(),
                iconSize: 28,
              ),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomExploreButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomExploreButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: FilledButton(
          onPressed: () {
            onPressed();
          },
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(1000),
            ),
            minimumSize: Size.fromHeight(56),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: AppTextStyles.buttonTitleStyle),
              const Icon(Icons.arrow_forward, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}