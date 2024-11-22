import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page_1.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page_2.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page_3.dart';
import 'package:pad_fundation/theme.dart';

class OnBoardingPageView extends StatefulWidget {
  @override
  _OnBoardingPageViewState createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  OnBoardingPage1(pageController: _pageController, currentPage: _currentPage),
                  OnBoardingPage2(pageController: _pageController, currentPage: _currentPage),
                  OnBoardingPage3(pageController: _pageController, currentPage: _currentPage),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
