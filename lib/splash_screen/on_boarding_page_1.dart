import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_2.dart';
import 'package:pad_fundation/theme.dart';

class OnBoardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 297.02,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img_splash_1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  'Kemudahan Pencarian Dana',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 10),
                // Subtitle
                Text(
                  'Solusi Terbaik untuk Sponsor\ndalam Pencarian Dana',
                  textAlign: TextAlign.center,
                  style: grayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(height: 40),
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDot(context, isActive: true, page: 1),
                    buildDot(context, isActive: false, page: 2),
                    buildDot(context, isActive: false, page: 3),
                  ],
                ),
                SizedBox(height: 40),
                // Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 330,
                    ),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to the next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OnBoardingPage2()),
                          );
                        },
                        child: Center(
                          child: Text(
                            'L A N J U T',
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // build tappable dots
  Widget buildDot(BuildContext context, {required bool isActive, required int page}) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specific page when the dot is tap
        if (page == 1) {
          Navigator.pushReplacementNamed(context, '/boarding-1');
        } else if (page == 2) {
          Navigator.pushReplacementNamed(context, '/boarding-2');
        } else if (page == 3) {
          Navigator.pushReplacementNamed(context, '/boarding-3');
        }
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
