import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/withdrawal_request_card.dart';

class WithdrawalRequestFailed extends StatelessWidget {
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
                      'Pencairan Dana',
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

    Widget card() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            WithdrawalRequestCard(
              amount: 'Rp200.000.000',
              recipientName: 'Faza Nabila',
              bankAndAccountNumber: 'Nama Bank - Nomor Rekening',
              buttonText: 'PERMINTAAN PENCAIRAN DANA GAGAL',
              buttonColor: brownButton,
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '*Informasi Bank Salah',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'Dana tidak dapat dikirimkan karena informasi bank yang dikirimkan tidak valid. Isi permintaan pencairan dana lagi dengan data rekening yang benar!',
              style: blackTextStyle.copyWith(
                fontSize: 11,
                fontWeight: regular,
              ),
              textAlign: TextAlign.justify,
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
          card(),
          body(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
    );
  }
}