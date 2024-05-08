import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:high_five_app/router/router.dart';
import 'package:high_five_app/theme/colors.dart';
import 'package:high_five_app/widgets/action_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 1;
                    });
                  },
                  controller: controller,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/onboarding/1.png', width: MediaQuery.of(context).size.width * 0.8),
                            Text(
                              'Welcome to Poker chance',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 34,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              'Our application will help you analyze your gaming activity in card games',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: AppColors.lightPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/onboarding/2.png', width: MediaQuery.of(context).size.width * 0.8),
                            Text(
                              'Make your game more successful',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 34,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              'We will help you better understand your gaming strategy ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: AppColors.lightPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ActionButtonWidget(
                  text: 'Continue',
                  width: MediaQuery.of(context).size.width * 0.8,
                  onTap: () {
                    isLastPage ? context.router.push(ResultRoute()) :
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(
                  activeDotColor: AppColors.white,
                  dotColor: AppColors.white55,
                  dotHeight: 12,
                  dotWidth: 32,
                  radius: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
