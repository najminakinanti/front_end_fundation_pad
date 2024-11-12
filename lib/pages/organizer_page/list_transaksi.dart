import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/transaction_card.dart';

class ListTransaksi extends StatelessWidget {

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
                      'List Transaksi',
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

    Widget withdrawButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/penerima');
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
            'TARIK DANA',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Diproses',
              onTap: () {
                Navigator.pushNamed(context, '/withdrawal-req');
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Faza Nabila',
              amount: 'Rp150.000.000,-',
              status: 'Gagal',
              onTap: () {
                print('faza tapped!');
              },
            ),
            TransactionCard(
              name: 'Rila Najjakha',
              amount: 'Rp100.000.000,-',
              status: 'Selesai',
              onTap: () {
                print('rila tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Diproses',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Selesai',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Gagal',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Gagal',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Diproses',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Selesai',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Gagal',
              onTap: () {
                print('anti tapped!');
              },
            ),
            TransactionCard(
              name: 'Najmina Kinanti',
              amount: 'Rp200.000.000,-',
              status: 'Diproses',
              onTap: () {
                print('anti tapped!');
              },
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
          withdrawButton(),
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
