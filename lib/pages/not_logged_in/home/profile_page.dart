import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Akun',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_logo_2.png',
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Anda tidak dapat mengakses Akun',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Untuk mengakses akun, Anda harus',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Text(
                'Daftar terlebih dahulu!',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Registrasi sekarang dan nikmati kemudahannya',
                style: greenTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose-role');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'DAFTAR SEKARANG',
                        style: whiteTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 5),
                      Image.asset(
                        'assets/icon_panah_kanan.png',
                        width: 6,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(child: content()),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}