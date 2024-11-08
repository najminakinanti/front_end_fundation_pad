import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class KirimSponsorMitra extends StatelessWidget {
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
                      'Events',
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

    Widget sponsorInfoCard() {
      return Container(
        margin: EdgeInsets.only(top: 1),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(3),
          color: darkGray,
          strokeWidth: 1,
          dashPattern: [20, 20],
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                'assets/img_sponsor_mufest.png',
                width: 60,
                height: 60,
              ),
              SizedBox(width: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MuFest 2024',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'by Tech Musicompany',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                        fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 38),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan nama',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 13
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

    Widget nominalInput() {
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan nominal',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 13
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

    Widget paymentMethod() {
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan nominal',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 13
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

    Widget bottomBox() {
      return Container(
        padding: EdgeInsets.all(20),
        height: 220,
        decoration: BoxDecoration(
          color:navbarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian Pembayaran',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  'Rp100.000.000',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya Penanganan',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  'Rp100.000.000',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  'Rp100.000.000',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kirim-sponsor-mitra');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'KIRIM SPONSOR',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          sponsorInfoCard(),
          nameInput(),
          nominalInput(),
          paymentMethod(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      bottomNavigationBar: bottomBox(),
      body: content(),
    );
  }


}