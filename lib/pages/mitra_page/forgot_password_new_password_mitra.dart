import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

import '../../API/auth_api.dart';

class NewPasswordMitra extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPasswordMitra> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

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

  Future<void> _resetPassword() async {
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    if (email == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email tidak ditemukan')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password dan konfirmasi harus sama')),
      );
      return;
    }

    if (_passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password minimal 8 karakter')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await AuthApi.resetPasswordWithOtp(email, _passwordController.text);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Password berhasil direset')),
      // );
      Navigator.pushNamedAndRemoveUntil(context, '/login-mitra', (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal reset password: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
              'Kata Sandi Baru',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget subTitle() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        child: Text(
          'Buat Kata Sandi',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'Pastikan kata sandi sesuai kriteria keamanan dan belum pernah digunakan',
          style: grayTextStyle.copyWith(
            fontSize: 13,
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        child: SizedBox(
          height: 50,
          child: TextFormField(
            controller: _passwordController,
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
            controller: _confirmPasswordController,
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

    Widget saveButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 29),
        child: ElevatedButton(
          onPressed: _isLoading ? null : _resetPassword,
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: _isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
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
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title(),
              subTitle(),
              description(),
              passwordInput(),
              passwordInputVerif(),
              saveButton()
            ],
          ),
        ),
      ),
    );
  }
}