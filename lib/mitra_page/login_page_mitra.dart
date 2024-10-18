import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_3.dart';
import 'package:pad_fundation/theme.dart';

class LoginPageMitra extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageMitra> {
  bool isRememberMeChecked = false;
  bool _isObscured = true; // Menambahkan boolean untuk mengatur status kata sandi

  void _toggleObscured() {
    setState(() {
      _isObscured = !_isObscured; // Mengubah status ketika ikon mata ditekan
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Masuk Akun',
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Untuk masuk akun, masukkan nama dan kata sandi',
                  textAlign: TextAlign.start,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: reguler,
                  ),
                ),
                SizedBox(height: 20),
                // Logo placeholder
                Container(
                  width: 100,
                  height: 96.29,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img_logo_2.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'FUNDation',
                  style: greenTextStyle.copyWith(
                    fontSize: 34,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(height: 20),
                // Email field
                SizedBox(
                  width: 329,
                  height: 48,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: grayTextStyle.copyWith(fontSize: 12),
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
                ),
                SizedBox(height: 20),
                // Password field with toggle visibility
                SizedBox(
                  width: 329,
                  height: 48,
                  child: TextFormField(
                    obscureText: _isObscured, // Menggunakan status _isObscured
                    decoration: InputDecoration(
                      labelText: 'Kata sandi',
                      labelStyle: grayTextStyle.copyWith(fontSize: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      suffixIcon: IconButton(
                        icon: Image.asset(
                          _isObscured
                              ? 'assets/icon_eye.png' // Ganti dengan gambar mata tertutup
                              : 'assets/icon_eye.png',   // Ganti dengan gambar mata terbuka
                          width: 15,
                          height: 15,
                        ),
                        onPressed: _toggleObscured, // Mengubah status ketika ikon dipencet
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isRememberMeChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isRememberMeChecked = value!;
                            });
                          },
                        ),
                        Text('Ingatkan kata sandi'),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Fungsi untuk lupa kata sandi
                      },
                      child: Text(
                        'Lupa kata sandi?',
                        style: blueTextStyle, // Pastikan blueTextStyle didefinisikan
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 330, // Atur lebar tombol
                    height: 50, // Atur tinggi tombol
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Use buttonColor from theme.dart
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnBoardingPage3()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'M A S U K',
                          style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Belum punya akun? ',
                        style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Daftar',
                        style: greenTextStyle.copyWith(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Navigasi ke halaman pendaftaran
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  color: sageGreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align the content to the left
                    children: [
                      Text(
                        'Punya Event?',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Daftar sekarang dan rasakan keuntungan menjadi bagian dari kami',
                        textAlign: TextAlign.left, // Align text to the left
                        style: blackTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          // Fungsi pendaftaran event di sini
                        },
                        child: Text(
                          'DAFTAR SEKARANG',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
