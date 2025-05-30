import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/kontraprestasi.dart';
import 'edit_event_organizer.dart';

class AddKontraprestasi extends StatefulWidget {
  @override
  _AddKontraprestasiState createState() => _AddKontraprestasiState();
}

class _AddKontraprestasiState extends State<AddKontraprestasi> {
  final Map<String, int> iconNameToId = {
    'Platinum': 1,
    'Diamond': 2,
    'Gold': 3,
    'Silver': 4,
    'Bronze': 5,
  };

  List<Kontraprestasi> kontraprestasiList = [Kontraprestasi()];

  final List<TextEditingController> minSponsorControllers = [];
  final List<TextEditingController> maxSponsorControllers = [];

  @override
  void initState() {
    super.initState();
    for (var item in kontraprestasiList) {
      minSponsorControllers.add(TextEditingController(text: item.minSponsor?.toString() ?? ''));
      maxSponsorControllers.add(TextEditingController(text: item.maxSponsor?.toString() ?? ''));
    }
  }

  Future<void> saveKontraprestasiToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList = kontraprestasiList.map((item) => item.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    await prefs.setString('kontraprestasi_list', jsonString);
    print('Kontraprestasi disimpan ke SharedPreferences');
  }

  @override
  void dispose() {
    for (var c in minSponsorControllers) c.dispose();
    for (var c in maxSponsorControllers) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Widget buildDropdownTextFormField({
    //   required String labelText,
    //   required String hintText,
    //   required List<String> dropdownItems,
    //   required String? selectedValue,
    //   required ValueChanged<String?> onChanged,
    // }) {
    //   return Container(
    //     margin: EdgeInsets.only(top: 30),
    //     child: SizedBox(
    //       height: 48,
    //       child: DropdownButtonFormField<String>(
    //         value: selectedValue,
    //         onChanged: onChanged,
    //         decoration: InputDecoration(
    //           labelText: labelText,
    //           labelStyle: grayTextStyle.copyWith(fontSize: 14),
    //           border: OutlineInputBorder(
    //             borderSide: BorderSide(color: primaryColor),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: primaryColor),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: primaryColor),
    //           ),
    //           floatingLabelBehavior: FloatingLabelBehavior.always,
    //           contentPadding: EdgeInsets.symmetric(horizontal: 12),
    //         ),
    //         style: blackTextStyle.copyWith(
    //           fontSize: 14,
    //           fontWeight: FontWeight.normal,
    //         ),
    //         hint: Padding(
    //           padding: EdgeInsets.only(left: 0),
    //           child: Text(
    //             hintText,
    //             style: grayTextStyle.copyWith(fontSize: 14),
    //           ),
    //         ),
    //         items: dropdownItems.map((String value) {
    //           return DropdownMenuItem<String>(
    //             value: value,
    //             child: Text(
    //               value,
    //               style: blackTextStyle.copyWith(
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.normal,
    //               ),
    //             ),
    //           );
    //         }).toList(),
    //       ),
    //     ),
    //   );
    // }

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
      List<String> icons = ['Platinum', 'Diamond', 'Gold', 'Silver', 'Bronze'];

      return Container(
        margin: EdgeInsets.only(top: 10),
        child: DropdownButtonFormField<String>(
          value: selectedIcon,
          onChanged: onIconChanged,
          decoration: InputDecoration(
            labelText: 'Icon Kontraprestasi',
            labelStyle: grayTextStyle.copyWith(fontSize: 14),
            border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          style: blackTextStyle.copyWith(fontSize: 14),
          hint: Text('Pilih Icon Kontraprestasi', style: grayTextStyle.copyWith(fontSize: 14)),
          items: icons.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_${value.toLowerCase()}.png',
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text(value, style: blackTextStyle.copyWith(fontSize: 14)),
                ],
              ),
            );
          }).toList(),
        ),
      );
    }

    Widget rangeSponsor(int index) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                child: TextFormField(
                  controller: minSponsorControllers[index],
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    kontraprestasiList[index].minSponsor = int.tryParse(val);
                  },
                  decoration: InputDecoration(
                    labelText: 'Minimal Sponsor',
                    labelStyle: grayTextStyle.copyWith(fontSize: 14),
                    hintText: 'Jumlah Uang',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 48,
                child: TextFormField(
                  controller: maxSponsorControllers[index],
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    kontraprestasiList[index].maxSponsor = int.tryParse(val);
                  },
                  decoration: InputDecoration(
                    labelText: 'Maksimal Sponsor',
                    labelStyle: grayTextStyle.copyWith(fontSize: 14),
                    hintText: 'Jumlah Uang',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget detailEvent(int index) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: TextFormField(
          initialValue: kontraprestasiList[index].feedback,
          onChanged: (val) {
            kontraprestasiList[index].feedback = val;
          },
          maxLines: 5, // Bisa disesuaikan sesuai kebutuhan
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          decoration: InputDecoration(
            labelText: 'Detail Event',
            labelStyle: grayTextStyle.copyWith(fontSize: 14),
            hintText: 'Tuliskan detail mengenai event di sini',
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
      );
    }

    Widget addButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: () async {
            await saveKontraprestasiToPrefs(); // Simpan data ke SharedPreferences
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

    Widget content(int index) {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          iconKontraprestasi(
            selectedIcon: kontraprestasiList[index].title,
            onIconChanged: (value) {
              setState(() {
                kontraprestasiList[index].title = value;
                kontraprestasiList[index].iconPhotoKontraprestasisId = iconNameToId[value];
              });
            },
          ),
          rangeSponsor(index),
          detailEvent(index),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(0),
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
              'Kontraprestasi Berhasil Ditambahkan!',
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
                Navigator.of(context)
                  ..pop()      // Tutup dialog dulu
                  ..pop('refresh'); // Pop halaman dan kirim 'refresh' sebagai hasil
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
