import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

import '../../API/auth_api.dart';

class ForgotPasswordMitra extends StatefulWidget {
  @override
  _ForgotPasswordMitraState createState() => _ForgotPasswordMitraState();
}

class _ForgotPasswordMitraState extends State<ForgotPasswordMitra> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> sendOtp(String email) async {
    setState(() {
      isLoading = true;
    });

    try {
      await AuthApi.sendOtp(email);
      Navigator.pushNamed(context, '/verification', arguments: emailController.text,);
    } catch (e) {

    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
              'Lupa Kata Sandi',
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
          'Kami akan mengirimkan 6 digit kode ke email berikut ini',
          style: grayTextStyle.copyWith(
            fontSize: 13,
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Masukkan email',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 15
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

    Widget nextButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 29),
        child: TextButton(
          onPressed: isLoading
              ? null
              : () {
            final email = emailController.text.trim();
            if (email.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email tidak boleh kosong')),
              );
              return;
            }
            sendOtp(email);
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
              emailInput(),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
