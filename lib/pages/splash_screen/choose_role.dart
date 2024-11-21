import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class ChooseRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 96.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img_logo_2.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'FUNDation',
                  style: greenTextStyle.copyWith(
                    fontSize: 34,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  'Pilih Peran Anda',
                  style: greenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 230,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to the next page
                          Navigator.pushNamed(context, '/login-mitra');
                        },
                        child: Center(
                          child: Text(
                            'M I T R A',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5),
                Text(
                  'Dukung Event sebagai Mitra Sponsor',
                  style: grayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 230,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login-organizer');
                        },
                        child: Center(
                          child: Text(
                            'O R G A N I Z E R',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5),
                Text(
                  'Rencanakan Event Anda sebagai Organizer',
                  style: grayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
