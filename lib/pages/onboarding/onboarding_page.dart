import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'last_onboarding_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else if (details.delta.dx < 0) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: PageView(
          controller: _pageController,
          physics: const AlwaysScrollableScrollPhysics(),
          onPageChanged: (index) => setState(() => _currentPage = index),
          children: [
            OnboardingScreen(
              title: "Welcome to the Future of Living!",
              subtitle: "Make your life easier with Smart Home",
              imagePath: "assets/start1.png",
              onNext:
                  () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
              controller: _pageController,
              pageCount: 3,
            ),
            OnboardingScreen(
              title: "Tap. Swipe. Boom!",
              subtitle: "Turn on the lights. All with a flick of your finger.",
              imagePath: "assets/start3.png",
              onNext:
                  () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
              controller: _pageController,
              pageCount: 3,
            ),
            LastOnboardingScreen(
              title: "Your Home, Your Rules",
              subtitle: "Create scenes. Set the vibe.",
              imagePath: "assets/start2.png",
              controller: _pageController,
              pageCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
