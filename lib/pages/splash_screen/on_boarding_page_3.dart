import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/splash_screen/choose_role.dart';
import 'package:pad_fundation/theme.dart';

class OnBoardingPage3 extends StatelessWidget {
  final PageController pageController;
  final int currentPage;

  OnBoardingPage3({required this.pageController, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: defaultMargin / 2,
            bottom: 10, // atau nilai custom lainnya
          ),
          child: Column(
            children: [
              SizedBox(height: 45),
              Container(
                height: 297.02,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img_splash_3.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sukses Bersama,\nKolaborasi Tak Terbatas',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 10),
              Text(
                'Aplikasi Fundation untuk Organizer dan Mitra Industri',
                textAlign: TextAlign.center,
                style: grayTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(isActive: currentPage == 0, index: 0),
                  buildDot(isActive: currentPage == 1, index: 1),
                  buildDot(isActive: currentPage == 2, index: 2),
                ],
              ),
              SizedBox(height: 40),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseRole()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'M U L A I',
                      style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF667E7C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Center(
                  child: Text(
                    'L E W A T I',
                    style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
