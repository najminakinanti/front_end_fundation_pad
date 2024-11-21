import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class AddKontraprestasi extends StatefulWidget {
  @override
  _AddKontraprestasiState createState() => _AddKontraprestasiState();
}

class _AddKontraprestasiState extends State<AddKontraprestasi> {
  String selectedIcon = 'Gold';

  void onIconChanged(String? newIcon) {
    setState(() {
      selectedIcon = newIcon!;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget buildDropdownTextFormField({
      required String labelText,
      required String hintText,
      required List<String> dropdownItems,
      required String? selectedValue,
      required ValueChanged<String?> onChanged,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SizedBox(
          height: 48,
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: labelText,
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
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            hint: Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(
                hintText,
                style: grayTextStyle.copyWith(fontSize: 14),
              ),
            ),
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget buildTextFormField({
      required String labelText,
      String? hintText,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: grayTextStyle.copyWith(fontSize: 14),
              hintText: hintText,
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
              contentPadding: EdgeInsets.symmetric(
                vertical: 12, horizontal: 12,
              ),
            ),
          ),
        ),
      );
    }

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
                      'Tambah Kontraprestasi',
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

    Widget iconKontraprestasi({
      required String? selectedIcon,
      required ValueChanged<String?> onIconChanged,
    }) {
      List<String> icons = ['Gold', 'Silver', 'Bronze'];

      return buildDropdownTextFormField(
        labelText: 'Icon Kontraprestasi',
        hintText: 'Pilih Icon Kontraprestasi',
        dropdownItems: icons,
        selectedValue: selectedIcon,
        onChanged: onIconChanged,
      );
    }

    Widget namaKontraprestasi() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Nama Kontraprestasi',
          hintText: 'Masukkan Nama Kontraprestasi',
        ),
      );
    }

    Widget rangeSponsor() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildTextFormField(
                labelText: 'Minimal Sponsor',
                hintText: 'Jumlah Uang',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildTextFormField(
                labelText: 'Maksimal Sponsor',
                hintText: 'Jumlah Uang',
              ),
            ),
          ],
        ),
      );
    }

    Widget detailEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Detail Event',
          hintText: 'duh ini gimana ya bikin kotaknya lebih tingginya',
        ),
      );
    }

    Widget addButton() {
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
            ),
          ),
          child: Text(
            'TAMBAH KONTRAPRESTASI',
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
          iconKontraprestasi(selectedIcon: null, onIconChanged: (value) {}),
          namaKontraprestasi(),
          rangeSponsor(),
          detailEvent(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
      bottomNavigationBar: addButton(),
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
              'Perubahan berhasil dilakukan!',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(30, 40, 15, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ubah-event-organizer');
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
