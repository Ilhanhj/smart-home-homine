import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onNext;
  final PageController controller;
  final int pageCount;

  const OnboardingScreen({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onNext,
    required this.controller,
    required this.pageCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 28, color: Colors.lightBlueAccent),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(fontSize: 18, color: Colors.grey[400]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: pageCount,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.lightBlueAccent,
                      dotColor: Colors.grey.shade400,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),
                  InkWell(
                    onTap: onNext,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff0e5250),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
