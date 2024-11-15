import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/splash_screen/choose_role.dart';
import 'package:pad_fundation/theme.dart';

class OnBoardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                          image: AssetImage('assets/img_splash_3.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Sukses Bersama,\nKolaborasi Tak Terbatas',
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Aplikasi Fundation untuk Organizer dan Mitra Industri',
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
                      buildDot(context, isActive: false, page: 1),
                      buildDot(context, isActive: false, page: 2),
                      buildDot(context, isActive: true, page: 3),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChooseRole()),
                            );
                          },
                          child: Center(
                            child: Text(
                              'M U L A I',
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, top: 5),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          'Masuk Tanpa Akun',
                          style: greenTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
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
      ),
    );
  }

  Widget buildDot(BuildContext context, {required bool isActive, required int page}) {
    return GestureDetector(
      onTap: () {
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

