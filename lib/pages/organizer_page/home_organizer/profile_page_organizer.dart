import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pad_fundation/API/auth_api.dart';
import 'package:pad_fundation/API/profile_api.dart';
import 'package:pad_fundation/theme.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageOrganizer extends StatefulWidget {
  @override
  _ProfilePageOrganizerState createState() => _ProfilePageOrganizerState();
}

class _ProfilePageOrganizerState extends State<ProfilePageOrganizer> {

  Map<String, dynamic>? _userProfile;
  Map<String, dynamic>? _organizerProfile;

  String? fullName, mail, phone;
  String? organizerName, address, description, province, city, photo_file;
  File? _imageFile;
  Uint8List? _imageBytes;

  Future<void> _loadProfileFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userIdString = prefs.getString('user_id');

    if (token != null && userIdString != null) {
      int userId = int.parse(userIdString);

      final userData = await ProfileApi.getUserProfile(userId, token);
      if (userData != null) {
        print('User Data: $userData');

        setState(() {
          _userProfile = userData;
          fullName = userData['data']['full_name'];
          mail = userData['data']['email'];
          phone = userData['data']['phone'];
          userId = userData['data']['id']; // simpan sebagai String jika perlu
        });
      }
    } else {
      print('Token atau User ID tidak ditemukan');
    }
  }

  Future<void> _loadOrganizerFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userIdString = prefs.getString('user_id');

    if (token != null && userIdString != null) {
      int userId = int.parse(userIdString);

      final organizerData = await ProfileApi.getOrganizerProfile(userId, token);
      if (organizerData != null  && mounted ) {
        print('Mitra Data: $organizerData');

        // Simpan data ke dalam state
        setState(() {
          _organizerProfile = organizerData;
          organizerName = organizerData['data']['name'];
          address = organizerData['data']['address'];
          description = organizerData['data']['description'];
          province = organizerData['data']['province'];
          city = organizerData['data']['city'];
          photo_file = organizerData['data']['photo_file'];
        });
        print('Photo file path: $photo_file');
      }
    } else {
      print('Token atau User ID tidak ditemukan');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfileFromApi();
    _loadOrganizerFromApi();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'Profile Anda',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget profile() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
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
                    child: Image.network(
                      '${ProfileApi.photourl}${photo_file ?? ''}',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/img_profile_picture.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Organizer',
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
        ),
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
              contentPadding: EdgeInsets.symmetric(
                  vertical: 12, horizontal: 12),
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
            Navigator.pushNamed(context, '/edit-password-organizer');
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
            Navigator.pushNamed(context, '/ubah-data-profile-organizer');
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
            'UBAH PROFILE',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget namaMitra() {
      TextEditingController nominalController = TextEditingController(
          text: organizerName ?? '',);

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
                  labelText: 'Nama Organizer',
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
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget provinsi() {
      TextEditingController nominalController = TextEditingController(
          text: province ?? '',);

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
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 12),
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
      TextEditingController nominalController = TextEditingController(
          text: city ?? '',);

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
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 12),
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
      TextEditingController nominalController = TextEditingController(
          text: address ?? '',);
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
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget editOrganizerButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 20, top: 25),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/edit-organizer');
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
            'UBAH ORGANIZER',
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

    Widget _buildDataDiriSection() {
      return Stack(
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
                borderRadius: BorderRadius.circular(5),
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
      );
    }

    Widget _buildDataOrganizerSection() {
      return Stack(
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
                editOrganizerButton(),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Organizer',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget content() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              profile(),
              _buildDataDiriSection(),
              _buildDataOrganizerSection(),
              keluarButton(),
              SizedBox(height: 40),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
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