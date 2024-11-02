import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class AddOrganizer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: Image.asset(
                  'assets/icon_panah_kiri.png',
                  width: 8,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tambah Organizer',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Untuk membuat akun, Isi data berikut',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget processLine() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(-1.0, 1.0),
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: lineColor2,
              valueColor: AlwaysStoppedAnimation<Color>(lineColor),
              minHeight: 5,
            ),
          ),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Data Organizer',
          style: greenTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget nameMitraInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Organizer',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/icon_home.png',
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

    Widget provinceInput() {
      final List<String> provinces = [
        'Jawa Tengah',
        'Jawa Barat',
        'Jakarta',
        'Surabaya',
      ];
      String? selectedProvince;

      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Provinsi',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/icon_location.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
                value: selectedProvince,
                items: provinces.map((String province) {
                  return DropdownMenuItem<String>(
                    value: province,
                    child: Text(
                      province,
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  selectedProvince = newValue;
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget cityInput() {
      final List<String> cities = [
        'Semarang',
        'Karanganyar',
        'Sukoharjo',
        'Salatiga',
      ];
      String? selectedCity;

      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kota',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/icon_location.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
                value: selectedCity,
                items: cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(
                      city,
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  selectedCity = newValue;
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget completeAddressInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat lengkap Organizer',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/icon_location.png',
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

    Widget pictureInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Gambar Organizer',
                  labelStyle: grayTextStyle.copyWith(
                    fontSize: 16,
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 0),
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: primaryColor),
                          right: BorderSide(color: primaryColor),
                          bottom: BorderSide(color: primaryColor),
                        ),
                        color: sageGreen2,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Unggah',
                          style: greenTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
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

    Widget descriptionInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Organizer',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 16
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

    Widget twoButtonRow() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 30, top: 30),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: sageGreen3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'SEBELUMNYA',
                  style: whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () {
                  //
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'SIMPAN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title(),
                        ],
                      ),
                    ),
                    processLine(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitle(),
                          nameMitraInput(),
                          provinceInput(),
                          cityInput(),
                          completeAddressInput(),
                          pictureInput(),
                          descriptionInput(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: twoButtonRow(),
            ),
          ],
        ),
      ),
    );
  }
}