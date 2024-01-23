// ignore_for_file: camel_case_types, use_build_context_synchronously
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Onboarding(),
    );
  }

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF46B177),
        elevation: 0.0,
        toolbarHeight: 70,
        actions: [
          TextButton(
            onPressed: () {
              controller.jumpToPage(3);
            },
            child: const Text(
              'SKIP',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF46B177),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 3);
          },
          children: [
            buildPage(
              color: const Color(0xFF46B177),
              urlImage: 'assets/image1.png',
              title: 'WELCOME TO OUR APP',
              subtitle:
                  'Simplify your shopping experience and take control of your grocery budget.',
            ),
            buildPage(
              color: const Color(0xFF46B177),
              urlImage: 'assets/image2.png',
              title: 'BUDGET LIKE A PRO',
              subtitle:
                  'Set, track, and achieve your grocery spending goals effortlessly with our app.',
            ),
            buildPage(
              color: const Color(0xFF46B177),
              urlImage: 'assets/image3.png',
              title: 'STAY ORGANIZED',
              subtitle:
                  ' Access your grocery lists and budget info on the go, making shopping a breeze.',
            ),
            buildPage(
              color: const Color(0xFF46B177),
              urlImage: 'assets/image4.png',
              title: 'SHOPPING EXPERIENCE',
              subtitle:
                  'Tailor your shopping lists to your preferences and dietary needs for a personalized experience.',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF46B177),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(80),
                  elevation: 5, // Add this line for shadow
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF46B177),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            )
          : Container(
              color: const Color(0xFF46B177),
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: WormEffect(
                      spacing: 5,
                      dotColor: const Color.fromARGB(255, 206, 206, 206),
                      activeDotColor: Colors.teal.shade700,
                    ),
                    onDotClicked: (index) => controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 70,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(-2, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 1),
                      IconButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 70,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 50),
            Text(
              title,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      );
}
