import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class VerificationMitra extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icon_panah_kiri.png',
                width: 8,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Kode Verifikasi',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        child: Text(
          'Masukkan kode verifikasi yang telah dikirim ke email Anda',
          style: grayTextStyle.copyWith(
            fontSize: 13,
            fontWeight: reguler,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget verifCode() {
      return Container(
        width: 40,
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      );
    }

    Widget verifCodeInput() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) => verifCode()),
        ),
      );
    }

    Widget sendButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 29),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new-password');
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
          child: Text(
            'KIRIM',
            style: whiteTextStyle.copyWith(
              fontSize: 15,
              fontWeight: medium,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title(),
              description(),
              verifCodeInput(),
              sendButton(),
            ],
          ),
        ),
      ),
    );
  }
}