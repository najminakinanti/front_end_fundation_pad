import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class OnBoardingPage2 extends StatelessWidget {
  final PageController pageController;
  final int currentPage;

  OnBoardingPage2({required this.pageController, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image section
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 297.02,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_splash_2.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Memperluas Jangkauan Brand',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          SizedBox(height: 10),
          Text(
            'Solusi Terbaik untuk Meningkatkan Brand Mitra Industri\n dengan Event yang Tepat',
            textAlign: TextAlign.center,
            style: grayTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDot(isActive: currentPage == 0, index: 0),
              buildDot(isActive: currentPage == 1, index: 1),
              buildDot(isActive: currentPage == 2, index: 2),
            ],
          ),
          SizedBox(height: 40),
          // Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Center(
                child: Text(
                  'L A N J U T',
                  style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required bool isActive, required int index}) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: isActive ? 20 : 10,
        height: 10,
        decoration: BoxDecoration(
          color: isActive ? primaryColor : darkGray,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
