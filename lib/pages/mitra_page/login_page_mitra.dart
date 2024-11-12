import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class LoginPageMitra extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageMitra> {
  bool _isObscured = true;
  bool _rememberMe = false;

  void _toggleObscured() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false; // Update checkbox state
    });
  }

  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk Akun',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              )
            ),
            SizedBox(height: 5,),
            Text('Untuk masuk akun, masukkan nama dan kata sandi',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              )
            ),
          ],
        )
      );
    }

    Widget image() {
      return Container(
        margin: EdgeInsets.only(top: 42),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 96.29,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img_logo_2.png'),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'FUNDation',
                style: greenTextStyle.copyWith(
                  fontSize: 34,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 36),
        child: Column(
          children: [
            SizedBox(
              height: 50,
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
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Kata sandi',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      _isObscured
                          ? 'assets/icon_eye_close.png'
                          : 'assets/icon_eye_open.png',
                      width: 15,
                      height: 15,
                    ),
                    onPressed: _toggleObscured,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget forgotPassword() {
      return Padding(
        padding: EdgeInsets.only(top: 4),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/forgot-password');
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Lupa kata sandi?',
              style: blueTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
          ),
        ),
      );
    }

    Widget rememberMe() {
      return Container(
        margin: EdgeInsets.only(top: 0),
        child: Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: _toggleRememberMe,
              activeColor: primaryColor,
            ),
            Text(
              'Ingatkan kata sandi',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget loginButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home-mitra');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          child: Text(
            'M A S U K',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget haveAccount() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun?',
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register-mitra');
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
              ),
              child: Text(
                'Daftar',
                style: greenTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
        color: sageGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Punya Event?',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            ),

            SizedBox(height: 5),

            Text(
              'Daftar sekarang dan rasakan keuntungan menjadi bagian dari kami',
              textAlign: TextAlign.left,
              style: blackTextStyle.copyWith(
                fontSize: 11,
                fontWeight: bold,
              ),
            ),

            SizedBox(height: 15),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register-organizer');
              },
              style: TextButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DAFTAR SEKARANG',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icon_panah_kanan.png',
                    width: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    image(),
                    emailInput(),
                    passwordInput(),
                    forgotPassword(),
                    rememberMe(),
                    loginButton(),
                    haveAccount(),
                  ],
                ),
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}