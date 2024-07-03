import 'dart:ui';
import 'package:condition/Onboarding/onboarding_items.dart';
import 'package:condition/screens/Welcome_screen.dart';
import 'package:condition/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/login_screen/Login_screen.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  void _onNextPressed(){
    if (pageController.page == controller.items.length-1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
    }
    else{
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen())),
              child: const Text('Skip',
                  style: TextStyle(
                      fontSize: 17,
                      color: primaryColor)),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: primaryColor,
              ),
            ),
            TextButton(
                onPressed: () => _onNextPressed(),
                child: const Image(
                  image: AssetImage('assets/onboardingimage/Next.png'),
                )),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          controller: pageController,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(controller.items[index].image),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(controller.items[index].title,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold))),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(controller.items[index].description,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.grey[600]))),
                ),
                // const SizedBox(height: 20),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                //   child: Row(
                //     children: [
                //       Image(image: AssetImage('assets/onboardingimage/Back.png'),),
                //       SizedBox(width: 10),
                //       Image(image: AssetImage('assets/onboardingimage/Next.png'),),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10),
                // Container(
                //   height: 120,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.orange[200],
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Center(
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: Colors.orange,
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       width: 300,
                //       height: 60,
                //       child: Center(child: Text('Next',style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 20)),)),
                //     ),
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
