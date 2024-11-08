import 'package:flutter/material.dart';
import '../../../theme.dart';

class UbahNomor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Header with AppBar
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: Text(
          'Ubah Nomor ',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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

    Widget telp() {
      TextEditingController nominalController = TextEditingController(text: '088851453890'); // Set initial text

      return Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telephone',
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,  // Keep label above input
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icon_silang.png',
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
              telp(),
            ],
          ),
        ),
      ),
    );
  }
}