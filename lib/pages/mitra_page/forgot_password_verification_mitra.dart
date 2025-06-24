import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

import '../../API/auth_api.dart';

class VerificationMitra extends StatefulWidget {
  @override
  _VerificationMitraState createState() => _VerificationMitraState();
}

class _VerificationMitraState extends State<VerificationMitra> {
  late String email;
  List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  bool isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final emailArg = ModalRoute.of(context)?.settings.arguments as String?;
    email = emailArg ?? '';
    print('Email argument in didChangeDependencies: $email');
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> verifyOtp() async {
    final otp = otpControllers.map((c) => c.text).join();
    if (otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mohon masukkan kode OTP lengkap (6 digit).')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await AuthApi.verifyOtp(email, int.parse(otp));
      Navigator.pushNamed(context, '/new-password', arguments: email);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifikasi gagal: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailArg = ModalRoute.of(context)?.settings.arguments as String?;
    print('Email argument in build: $emailArg');

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
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget verifCode(int index) {
      return Container(
        width: 40,
        child: TextField(
          controller: otpControllers[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1 && index < 5) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      );
    }

    Widget verifCodeInput() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) => verifCode(index)),
        ),
      );
    }

    Widget sendButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 29),
        child: TextButton(
          onPressed: isLoading ? null : verifyOtp,
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