import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:flutter/services.dart';

class ProfilePageOrganizer extends StatelessWidget {
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
                  Image.asset(
                    'assets/img_chat4.png',
                    width: 80,
                    height: 80,
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
        initialValue: 'Fazaya',
        iconPath: 'assets/icon_user.png',
      );
    }

    Widget email() {
      return buildTextFormField(
        labelText: 'Email',
        initialValue: 'fazaya123@gmail.com',
        iconPath: 'assets/icon_email.png',
      );
    }

    Widget telp() {
      return buildTextFormField(
        labelText: 'Nomor Telephone',
        initialValue: '08658646376453',
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
      TextEditingController nominalController = TextEditingController(
          text: 'FAZA');

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
          text: 'Jawa Tengah');

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
          text: 'Semarang');

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
          text: 'Jalan Mawar');
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
            backgroundColor: buttonColor,
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
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Keluar',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
          content: Container(
            width: 250,
            child: Text(
              'Apakah Anda yakin ingin keluar dari aplikasi?',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'BATAL',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/choose-role');
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