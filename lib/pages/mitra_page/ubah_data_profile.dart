import 'package:flutter/material.dart';
import '../../../theme.dart';

class UbahDataProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: Text(
          'Ubah Data Profile',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Image.asset(
            'assets/icon_panah_kiri.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset(
                'assets/icon_check.png',
                width: 15,
                height: 15,
              ),
            ),
          ),
        ],
      );
    }

    Widget nama() {
      TextEditingController nominalController = TextEditingController(text: 'Govan Dwi');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
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
                      onTap: () {
                        Navigator.pushNamed(context, '/ubah-nama');
                      },
                      child: Image.asset(
                        'assets/icon_panah_kanan_hitam.png',
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget email() {
      TextEditingController nominalController = TextEditingController(text: 'govandwi@gmail.com');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Email',
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
                      onTap: () {
                        Navigator.pushNamed(context, '/ubah-email');
                      },
                      child: Image.asset(
                        'assets/icon_panah_kanan_hitam.png',
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget telp() {
      TextEditingController nominalController = TextEditingController(text: '088851453890');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Nomor Telephone',
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
                      onTap: () {
                        Navigator.pushNamed(context, '/ubah-nomor');
                      },
                      child: Image.asset(
                        'assets/icon_panah_kanan_hitam.png',
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              nama(),
              email(),
              telp(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}