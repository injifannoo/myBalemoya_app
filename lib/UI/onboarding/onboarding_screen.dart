import 'package:my_balemoya_app/controllers/exports.dart';
import 'package:my_balemoya_app/UI/onboarding/widgets/page_one.dart';
import 'package:my_balemoya_app/UI/onboarding/widgets/page_three.dart';
import 'package:my_balemoya_app/UI/onboarding/widgets/page_two.dart';
import 'package:flutter/material.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose(); //implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? iconWidth;
    double? headersize;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    bool isPortrait = orientaion == Orientation.portrait;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        iconWidth = sWidth / 50;
        headersize = 16;
      } else {
        iconWidth = sWidth / 50;
        headersize = 14;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        iconWidth = sWidth / 50;
        headersize = 16;
      } else {
        headersize = 15;
        iconWidth = sWidth / 50;
      }
    }
    return Scaffold(body: Consumer<OnBoardNotifier>(
      builder: (context, OnBoardNotifier, child) {
        return Stack(
          children: [
            PageView(
              controller: pageController,
              physics: OnBoardNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              onPageChanged: (page) {
                OnBoardNotifier.isLastPage = page == 2;
              },
              children: const [PageOne(), PageTwo(), PageThree()],
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: OnBoardNotifier.isLastPage
                  ? const SizedBox.shrink()
                  : Center(
                      child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: isPortrait
                              ? WormEffect(
                                  dotHeight: iconWidth!,
                                  dotWidth: iconWidth,
                                  spacing: 10,
                                  dotColor:
                                      Color(kDarkGrey.value).withOpacity(0.5))
                              : WormEffect(
                                  dotHeight: 1,
                                  dotWidth: 1,
                                  spacing: 10,
                                  dotColor:
                                      Color(kDarkGrey.value).withOpacity(0.5))),
                    ),
            ),
            Positioned(
                child: OnBoardNotifier.isLastPage
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(2);
                                },
                                child: ReusableText(
                                    text: "Skip",
                                    style: appstyle(headersize!,
                                        Color(kBlue.value), FontWeight.normal)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: ReusableText(
                                    text: "Next",
                                    style: appstyle(headersize,
                                        Color(kBlue.value), FontWeight.normal)),
                              ),
                            ],
                          ),
                        ),
                      ))
          ],
        );
      },
    ));
  }
}
