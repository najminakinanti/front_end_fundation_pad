import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/withdrawal_request_card.dart';

class WithdrawalRequestWaiting extends StatelessWidget {
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
              recipientName: 'Najmina Kinanti',
              bankAndAccountNumber: 'Nama Bank - Nomor Rekening',
              buttonText: 'PERMINTAAN PENCAIRAN DANA TERKIRIM',
              buttonColor: yellowButton,
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
              '*Proses Pencairan Sedang Diproses',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'Dana sedang dalam proses percobaan pengiriman oleh Admin. Pantau terus untuk mengetahui status permintaan pencairan dana berhasil atau gagal.',
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
