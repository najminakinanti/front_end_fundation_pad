import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class Nominal extends StatelessWidget {
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
                      'Nominal',
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

    Widget nominal() {
      TextEditingController controller = TextEditingController();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Nominal',
            style: lighGrayTextStyle.copyWith(fontSize: 14),
          ),
          SizedBox(height: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rp ',
                style: blackTextStyle.copyWith(fontSize: 34, fontWeight: bold),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  style: blackTextStyle.copyWith(fontSize: 34, fontWeight: bold),
                  decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: blackTextStyle.copyWith(fontSize: 34, fontWeight: bold),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
            indent: 0,
            endIndent: 0,
          ),
        ],
      );
    }

    Widget saldo() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo Dana Sumber',
                      style: lighGrayTextStyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rp 600.000.000',
                      style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/img_chat1.png'),
                  radius: 30,
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
              indent: 0,
              endIndent: 0,
            ),
          ],
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
            Navigator.pushNamed(context, '/withdrawal-req-waiting');
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
            'LANJUTKAN',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          nominal(),
          saldo(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
      bottomNavigationBar: nextButton(),
    );
  }
}
