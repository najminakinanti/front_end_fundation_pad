import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class TambahBuktiKontraprestasi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
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
                      'Tambah Bukti Kontraprestasi',
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

    Widget nextButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            showConfirmationDialog(context);
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

    Widget fotoKontraprestasi() {
      TextEditingController nominalController = TextEditingController();

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
                  hintText: 'Masukkan foto',
                  hintStyle: grayTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
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
      TextEditingController nominalController = TextEditingController();
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
                    hintText: 'Masukkan Deskripsi Kontraprestasi',
                    hintStyle: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
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
            Navigator.pushNamed(context, '/ubah-bukti-kontraprestasi');

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

    Widget content() {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
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
                            'Bukti Kontraprestasi 1',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
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
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: tambahBuktiButton(),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
      bottomNavigationBar: nextButton(),
    );
  }
  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 250,
            child: Text(
              'Kontraprestasi berhasil ditambahkan!',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(30, 40, 20, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail-my-event-organizer');
              },
              child: Text(
                'OK',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
          ],
        );
      },
    );
  }
}
