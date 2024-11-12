import 'package:flutter/material.dart';
import '../../../theme.dart';

class UbahEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Header with AppBar
    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, defaultMargin, 0),
        child: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: false,
          title: Text(
            'Ubah Email',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Image.asset(
              'assets/icon_panah_kiri.png',
              width: 15,
              height: 15,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Image.asset(
                  'assets/icon_check.png',
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget email() {
      TextEditingController nominalController = TextEditingController(text: 'govandwi@gmail.com'); // Set initial text

      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                decoration: InputDecoration(
                  labelText: 'Email',
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
              email(),
            ],
          ),
        ),
      ),
    );
  }
}