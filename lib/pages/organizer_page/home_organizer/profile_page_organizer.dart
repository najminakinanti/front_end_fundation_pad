import 'package:flutter/material.dart';
import '../../../theme.dart';

class ProfilePageOrganizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tambah Bukti Kontraprestasi',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      );
    }

    Widget fotoKontraprestasi() {
      TextEditingController nominalController = TextEditingController(text: 'Masukkan foto');

      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Foto Kontraprestasi',
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
                  suffixIcon: GestureDetector(
                    onTap: () {},
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


    Widget deskripsiKontraprestasi() {
      TextEditingController nominalController = TextEditingController(text: 'Masukan Deskripsi Kontraprestasi');
      bool isCleared = false;

      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus && !isCleared) {
                    nominalController.clear();
                    isCleared = true;
                  }
                },
                child: TextFormField(
                  controller: nominalController,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Kontraprestasi',
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
            ),
          ],
        ),
      );
    }

    // 2
    Widget fotoKontraprestasi2() {
      TextEditingController nominalController = TextEditingController(text: 'Masukkan foto');

      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Foto Kontraprestasi',
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
                  suffixIcon: GestureDetector(
                    onTap: () {},
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


    Widget deskripsiKontraprestasi2() {
      TextEditingController nominalController = TextEditingController(text: 'Masukan Deskripsi Kontraprestasi');
      bool isCleared = false;

      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus && !isCleared) {
                    nominalController.clear();
                    isCleared = true;
                  }
                },
                child: TextFormField(
                  controller: nominalController,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Kontraprestasi',
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
            ),
          ],
        ),
      );
    }

    Widget tambahBuktiButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 60, top: 10),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail-event');
          },
          style: TextButton.styleFrom(
            backgroundColor: button,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'TAMBAH BUKTI KONTRAPRESTASI',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget simpanBuktiButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 10, top: 50),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail-event');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'SIMPAN BUKTI KONTRAPRESTASI',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
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
                      color: backgroundyellow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        fotoKontraprestasi2(),
                        deskripsiKontraprestasi2(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: sageGreen3,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Bukti Kontraprestasi 1',
                        style: lighGrayTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
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
                      color: backgroundyellow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        fotoKontraprestasi(),
                        deskripsiKontraprestasi(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: sageGreen3,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Bukti Kontraprestasi 2',
                        style: lighGrayTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              tambahBuktiButton(),
              simpanBuktiButton(),
              SizedBox(height: 40),
            ],

          ),
        ),
      ),
    );
  }
}