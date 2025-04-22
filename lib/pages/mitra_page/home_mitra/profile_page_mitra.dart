import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pad_fundation/API/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme.dart';

class ProfilePageMitra extends StatefulWidget {
  @override
  _ProfilePageMitraState createState() => _ProfilePageMitraState();
}

class _ProfilePageMitraState extends State<ProfilePageMitra> {

  String? fullName, mail, phone;
  String? mitraName, address, description, province, city, photo_file;
  File? _imageFile;
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  // Load data from SharedPreferences
  Future<void> _loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('full_name');
      mail = prefs.getString('email');
      phone = prefs.getString('phone');
      mitraName = prefs.getString('name');
      address = prefs.getString('address');
      description = prefs.getString('description');
      province = prefs.getString('province');
      city = prefs.getString('city');
      photo_file = prefs.getString('photo_file');
      print('photo_file dari SharedPreferences: $photo_file');

      if (photo_file != null && photo_file!.isNotEmpty) {
        _imageBytes = base64Decode(photo_file!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Profile Anda',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),

          Center(
            child: Column(
              children: [
                _imageBytes != null
                    ? ClipOval(
                  child: Image.memory(
                    _imageBytes!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                )
                    : ClipOval(
                  child: Image.asset(
                    'assets/img_chat3.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Mitra Industri',
                  style: lighGrayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      );
    }

    Widget buildTextFormField({
      required String labelText,
      required String initialValue,
      required String iconPath,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: TextEditingController(text: initialValue),
            readOnly: true,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: grayTextStyle.copyWith(fontSize: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              suffixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    iconPath,
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget nama() {
      return buildTextFormField(
        labelText: 'Nama Lengkap',
        initialValue: fullName ?? '',
        iconPath: 'assets/icon_user.png',
      );
    }

    Widget email() {
      return buildTextFormField(
        labelText: 'Email',
        initialValue: mail ?? '',
        iconPath: 'assets/icon_email.png',
      );
    }

    Widget telp() {
      return buildTextFormField(
        labelText: 'Nomor Telephone',
        initialValue: phone ?? '',
        iconPath: 'assets/icon_telp.png',
      );
    }

    Widget gantiKataSandiButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 5, top: 25),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/edit-password-mitra');
          },
          style: TextButton.styleFrom(
            backgroundColor: sageGreen4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'GANTI KATA SANDI',
            style: whiteTextStyle.copyWith(
              fontSize: 14,

              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget gantiProfileButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 20, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/ubah-data-profile');
          },
          style: TextButton.styleFrom(
            backgroundColor: lineColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'GANTI PROFILE',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget namaMitra() {
      TextEditingController nominalController = TextEditingController(text: mitraName ?? '',);

      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Nama Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget provinsi() {
      TextEditingController nominalController = TextEditingController(text: province ?? '',);

      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Provinsi',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/icon_pin.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget kota() {
      TextEditingController nominalController = TextEditingController(text: city ?? '',);

      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Kota',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/icon_pin.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alamat() {
      TextEditingController nominalController = TextEditingController(text: address ?? '',);
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Alamat lengkap',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget deskripsi() {
      TextEditingController nominalController = TextEditingController(text: description ?? '',);
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget editMitraButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 20, top: 25),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/edit-mitra');
          },
          style: TextButton.styleFrom(
            backgroundColor: lineColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'EDIT MITRA',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget keluarButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 80, top: 10),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            showConfirmationDialog(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: darkBrown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'KELUAR',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        nama(),
                        email(),
                        telp(),
                        gantiKataSandiButton(),
                        gantiProfileButton(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5), // Border radius untuk teks "Data Diri"
                      ),
                      child: Text(
                        'Data Diri',
                        style: lighGrayTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        namaMitra(),
                        provinsi(),
                        kota(),
                        alamat(),
                        deskripsi(),
                        editMitraButton(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5), // Border radius untuk background teks
                      ),
                      child: Text(
                        'Data Mitra Industri',
                        style: lighGrayTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              keluarButton(),
              SizedBox(height: 40),
            ],

          ),
        ),
      ),
    );
  }
  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) { // Gunakan context lokal dari builder
        return AlertDialog(
          title: Text(
            'Konfirmasi Keluar',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
          content: Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Gunakan dialogContext, bukan context utama
              },
              child: Text(
                'BATAL',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog sebelum logout

                // Jalankan logout setelah navigasi selesai untuk menghindari error context
                Future.delayed(Duration.zero, () async {
                  try {
                    await AuthApi.logout(context); // Gunakan context asli untuk navigasi
                    print('Logout API called successfully');
                  } catch (e) {
                    print('Error saat logout: $e');
                  }
                });
              },
              child: Text(
                'YA',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
          ],
        );
      },
    );
  }
}