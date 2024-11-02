import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class RegisterPageOrganizer extends StatefulWidget {
  @override
  _RegisterPageOrganizerState createState() => _RegisterPageOrganizerState();
}

class _RegisterPageOrganizerState extends State<RegisterPageOrganizer> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: Image.asset(
                  'assets/icon_panah_kiri.png',
                  width: 8,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buat Akun Organizer',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Untuk membuat akun, Isi data berikut',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget processLine() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: 0.5,
            backgroundColor: lineColor2,
            valueColor: AlwaysStoppedAnimation<Color>(lineColor),
            minHeight: 5,
          ),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Data Akun',
          style: greenTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 16
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget phoneNumberInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nomor Handphone',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 16
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 16
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            )
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
        margin: EdgeInsets.only(bottom: 30, top: 30),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add-organizer');
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
          child: Text(
            'LANJUT',
            style: whiteTextStyle.copyWith(
              fontSize: 15,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title(),
                        ],
                      ),
                    ),
                    processLine(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitle(),
                          nameInput(),
                          phoneNumberInput(),
                          emailInput(),
                          passwordInput(),
                          passwordInputVerif(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: nextButton(),
            ),
          ],
        ),
      ),
    );
  }
}