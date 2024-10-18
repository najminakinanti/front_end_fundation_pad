import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class LoginPageMitra extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageMitra> {
  bool isRememberMeChecked = false;

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
                  alignment: Alignment.centerLeft, // Align text to the left
                  child: Text(
                    'Masuk Akun',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Untuk masuk akun, masukkan nama dan kata sandi',
                  textAlign: TextAlign.start, // Align text to the start
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
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
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 20),
                // Email field
                SizedBox(
                  width: 329,
                  height: 48,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor), // Tambahkan border dengan warna primaryColor
                      borderRadius: BorderRadius.circular(4), // Radius untuk sudut
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: grayTextStyle.copyWith(fontSize: 12),
                        border: InputBorder.none, // Menghilangkan border default
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10), // Padding dalam TextFormField
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 20),
                // Password field
                SizedBox(
                  width: 329,
                  height: 48,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor), // Tambahkan border
                      borderRadius: BorderRadius.circular(4), // Radius untuk sudut
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Kata sandi',
                              labelStyle: grayTextStyle.copyWith(fontSize: 12),
                              border: InputBorder.none, // Menghilangkan border default
                              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10), // Menyesuaikan padding
                            ),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0), // Padding di kanan untuk gambar
                          child: Image.asset(
                            'assets/icon_eye.png', // gambar
                            width: 15, // Set lebar gambar
                            height: 15, // Set tinggi gambar
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
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
                        // Forgot password functionality here
                      },
                      child: Text(
                        'Lupa kata sandi ?',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // Login functionality here
                  },
                  child: Text(
                    'MASUK',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Navigation to sign up page
                  },
                  child: Text(
                    'Belum punya akun ? Daftar',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Text(
                        'Punya Event?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Daftar sekarang dan rasakan keuntungan menjadi bagian dari kami',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          // Register event functionality here
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
