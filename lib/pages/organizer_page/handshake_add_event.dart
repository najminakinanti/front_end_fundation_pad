import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pad_fundation/theme.dart';

import '../../models/kontraprestasi.dart';

class HandshakeAddEvent extends StatefulWidget {
  @override
  _HandshakeAddEventState createState() => _HandshakeAddEventState();
}

class _HandshakeAddEventState extends State<HandshakeAddEvent> {
  List<Kontraprestasi> kontraprestasiList = [Kontraprestasi()];

  Widget buildDropdownTextFormField({
    required String labelText,
    required String hintText,
    required List<String> dropdownItems,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 48,
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: grayTextStyle.copyWith(fontSize: 14),
            border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal),
          hint: Text(hintText, style: grayTextStyle.copyWith(fontSize: 14)),
          items: dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: blackTextStyle.copyWith(fontSize: 14)),
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
          style: blackTextStyle.copyWith(fontSize: 14),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: grayTextStyle.copyWith(fontSize: 14),
            hintText: hintText,
            border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
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

  Widget buildKontraprestasiForm(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconKontraprestasi(
          selectedIcon: kontraprestasiList[index].icon,
          onIconChanged: (value) {
            setState(() {
              kontraprestasiList[index].icon = value;
            });
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: buildTextFormField(
            labelText: 'Nama Kontraprestasi',
            hintText: 'Masukkan Nama Kontraprestasi',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: blackTextStyle.copyWith(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Minimal Sponsor',
                      labelStyle: grayTextStyle.copyWith(fontSize: 14),
                      hintText: 'Jumlah Uang',
                      border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: blackTextStyle.copyWith(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Maksimal Sponsor',
                      labelStyle: grayTextStyle.copyWith(fontSize: 14),
                      hintText: 'Jumlah Uang',
                      border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1, height: 40),
      ],
    );
  }

  Widget addKontraprestasiButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 30, top: 0),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setState(() {
            kontraprestasiList.add(Kontraprestasi());
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: creamButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: primaryColor, width: 1),
          ),
        ),
        child: Text(
          'Tambah Kontraprestasi',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(kontraprestasiList.length, (index) {
          return buildKontraprestasiForm(index);
        }),
        addKontraprestasiButton(),
      ],
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
