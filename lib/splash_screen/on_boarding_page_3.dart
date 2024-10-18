import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/choose_role.dart';
import 'package:pad_fundation/theme.dart';

class OnBoardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image or illustration section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img_splash_3.png'), // replace with your image
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Title
            Text(
              'Sukses Bersama,\nKolaborasi Tak Terbatas',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 10),
            // Subtitle
            Text(
              'Aplikasi Foundation untuk Organizer dan Mitra Industri',
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                fontSize: 12,
                fontWeight: reguler,
              ),
            ),
            SizedBox(height: 40),
            // Dots Indicator with tap functionality
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
              child: SizedBox(
                width: 330, // Atur lebar tombol
                height: 50, // Atur tinggi tombol
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Use buttonColor from theme.dart
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the next page
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Optional: Additional login button aligned to the right
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, top: 10), // Add padding for right alignment
                child: TextButton(
                  onPressed: () {
                    // Handle skip login or guest mode
                  },
                  child: Text(
                    'Masuk Tanpa Akun',
                    style: greenTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build tappable dots
  Widget buildDot(BuildContext context, {required bool isActive, required int page}) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specific page when the dot is tapped
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
        // Set width and height based on whether the dot is active or inactive
        width: isActive ? 20 : 10, // Oval for active and smaller for inactive
        height: 10,
        decoration: BoxDecoration(
          color: isActive ? primaryColor : darkGray,
          borderRadius: BorderRadius.circular(50)
        ),
      ),
    );
  }
}