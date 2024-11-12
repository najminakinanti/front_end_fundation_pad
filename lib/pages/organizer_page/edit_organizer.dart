import 'package:flutter/material.dart';
import '../../../theme.dart';

class EditOrganizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, defaultMargin, 0),
        child: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icon_panah_kiri.png',
                  width: 15,
                  height: 15,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Ubah Data Organizer',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          flexibleSpace: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: kToolbarHeight + 25),
                Image.asset(
                  'assets/img_chat4.png',
                  width: 80,
                  height: 80,
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
          toolbarHeight: 80,
        ),
      );
    }

    Widget namaInput() {
      TextEditingController nominalController = TextEditingController(text: 'Fazaya');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                decoration: InputDecoration(
                  labelText: 'Nama Organizer',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
      String? selectedProvince = 'Jawa Tengah';

      return Container(
        margin: EdgeInsets.only(top: 18, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 53,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Provinsi',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      style: grayTextStyle.copyWith(fontSize: 15),
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
      String? selectedCity = 'Semarang';

      return Container(
        margin: EdgeInsets.only(top: 18, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 53,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kota',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                      style: grayTextStyle.copyWith(fontSize: 15),
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

    Widget alamatInput() {
      TextEditingController nominalController = TextEditingController(text: 'Jalan Mawar');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                decoration: InputDecoration(
                  labelText: 'Alamat Lengkap',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icon_pin.png',
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

    Widget pictureInput() {
      TextEditingController nominalController = TextEditingController(text: 'WhatsApp Image 2024-11-08');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                decoration: InputDecoration(
                  labelText: 'Gambar Organizer',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  suffixIcon: Container(
                    width: 80,
                    height: 48,
                    decoration: BoxDecoration(
                      color: sageGreen2,
                      border: Border(
                        left: BorderSide(color: primaryColor),
                      ),
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
                          fontWeight: FontWeight.normal,
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

    Widget deskripsiInput() {
      TextEditingController nominalController = TextEditingController(text: 'Membuat event seputar bidang kuliner');

      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Organizer',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget simpanButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'SIMPAN',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              namaInput(),
              provinceInput(),
              cityInput(),
              alamatInput(),
              pictureInput(),
              deskripsiInput(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: content(),
      bottomNavigationBar: simpanButton(),
    );
  }
}