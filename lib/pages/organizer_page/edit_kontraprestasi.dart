import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class EditKontraprestasi extends StatefulWidget {
  @override
  _EditKontraprestasiState createState() => _EditKontraprestasiState();
}

class _EditKontraprestasiState extends State<EditKontraprestasi> {
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
      required String initialValue,
      required List<String> dropdownItems,
      required String? selectedValue,
      required ValueChanged<String?> onChanged,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SizedBox(
          height: 48,
          child: DropdownButtonFormField<String>(
            value: selectedValue ?? initialValue,
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
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular
            ),
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular
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
      required String initialValue,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: TextEditingController(text: initialValue),
            style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular
            ),
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
                      'Ubah Kontraprestasi',
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
      required String selectedIcon,
      required ValueChanged<String?> onIconChanged,
    }) {
      List<String> icons = ['Gold', 'Silver', 'Bronze'];

      return buildDropdownTextFormField(
        labelText: 'Ikon Kontraprestasi',
        initialValue: icons[0],
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
          initialValue: 'Gold',
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
                initialValue: '10.000.000',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildTextFormField(
                labelText: 'Maksimal Sponsor',
                initialValue: '15.000.000',
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
          initialValue: 'duh ini gimana ya bikin kotaknya lebih tingginya',
        ),
      );
    }

    Widget saveButton() {
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
            'SIMPAN PERUBAHAN',
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
          iconKontraprestasi(selectedIcon: selectedIcon, onIconChanged: onIconChanged),
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
      bottomNavigationBar: saveButton(),
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
