import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/API/api_service.dart';

class LoginPageOrganizer extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageOrganizer> {
  final ApiService apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;
  bool _rememberMe = false;

  void _toggleObscured() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

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
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Untuk masuk akun, masukkan nama dan kata sandi',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
          ),
        ],
      ),
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
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
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
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: EdgeInsets.only(top: 28),
      child: TextFormField(
        controller: passwordController,
        obscureText: _isObscured,
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
    );
  }

  Widget forgotPassword() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/forgot-password');
            },
            child: Text(
              'Lupa kata sandi?',
              style: blueTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
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
        onPressed: () async {
          apiService.login(emailController.text, passwordController.text);
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
      padding: EdgeInsets.all(30),
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
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAFTAR SEKARANG',
                  style: whiteTextStyle.copyWith(fontSize: 16),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    image(),
                    emailInput(),
                    passwordInput(),
                    forgotPassword(),
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
