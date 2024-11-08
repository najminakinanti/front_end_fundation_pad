import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class CreateNewPasswordMitra extends StatefulWidget {
  @override
  _CreateNewPasswordMitraState createState() => _CreateNewPasswordMitraState();
}

class _CreateNewPasswordMitraState extends State<CreateNewPasswordMitra> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  void _togglePasswordObscured() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _toggleConfirmPasswordObscured() {
    setState(() {
      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    });
  }

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
              'Kata Sandi',
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
        child: Column(
          children: [
            Text(
              'Buat Kata Sandi',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Pastikan password sesuai kriteria keamanan dan belum pernah digunakan',
              style: grayTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        child: SizedBox(
          height: 50,
          child: TextFormField(
            obscureText: _isPasswordObscured,
            decoration: InputDecoration(
              labelText: 'Kata sandi',
              labelStyle: grayTextStyle.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              suffixIcon: IconButton(
                icon: Image.asset(
                  _isPasswordObscured
                      ? 'assets/icon_eye_close.png'
                      : 'assets/icon_eye_open.png',
                  width: 15,
                  height: 15,
                ),
                onPressed: _togglePasswordObscured,
              ),
            ),
          ),
        ),
      );
    }

    Widget passwordInputVerif() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        child: SizedBox(
          height: 50,
          child: TextFormField(
            obscureText: _isConfirmPasswordObscured,
            decoration: InputDecoration(
              labelText: 'Konfirmasi Kata sandi',
              labelStyle: grayTextStyle.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              suffixIcon: IconButton(
                icon: Image.asset(
                  _isConfirmPasswordObscured
                      ? 'assets/icon_eye_close.png'
                      : 'assets/icon_eye_open.png',
                  width: 15,
                  height: 15,
                ),
                onPressed: _toggleConfirmPasswordObscured,
              ),
            ),
          ),
        ),
      );
    }

    Widget nextButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 29),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/home-mitra',
              arguments: 3,
            );
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
          child: Text(
            'SIMPAN',
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
          margin: EdgeInsets.only(
            top: 0,
            bottom: 48,
            left: defaultMargin,
            right: defaultMargin,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title(),
              description(),
              passwordInput(),
              passwordInputVerif(),
              Spacer(),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
