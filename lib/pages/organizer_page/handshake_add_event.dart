import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/kontraprestasi.dart'; // Pastikan file ini tersedia
import '../../theme.dart'; // Pastikan file ini tersedia

class HandshakeAddEvent extends StatefulWidget {
  const HandshakeAddEvent({Key? key}) : super(key: key);

  @override
  HandshakeAddEventState createState() => HandshakeAddEventState();
}

class HandshakeAddEventState extends State<HandshakeAddEvent> {
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
  final List<TextEditingController> feedbackControllers = [];
  final TextEditingController feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in kontraprestasiList) {
      minSponsorControllers.add(TextEditingController(text: item.minSponsor?.toString() ?? ''));
      maxSponsorControllers.add(TextEditingController(text: item.maxSponsor?.toString() ?? ''));
      feedbackControllers.add(TextEditingController(text: item.feedback ?? ''));
    }
  }

  Future<void> saveKontraprestasiToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Update feedback di objek sebelum disimpan
    for (int i = 0; i < kontraprestasiList.length; i++) {
      kontraprestasiList[i].feedback = feedbackControllers[i].text;
    }

    // Encode list ke JSON dan simpan
    List<Map<String, dynamic>> jsonList = kontraprestasiList.map((item) => item.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    await prefs.setString('kontraprestasi_list', jsonString);

    // Debug print semua yang tersimpan
    print('✅ Kontraprestasi dan feedback disimpan ke SharedPreferences\n');

    print('🔸 JSON Kontraprestasi List:');
    print(jsonString);

    print('\n🔸 Feedback Global:');
    print(feedbackController.text);

    // Jika ingin lihat semua keys:
    print('\n📦 Semua isi SharedPreferences:');
    prefs.getKeys().forEach((key) {
      print('$key: ${prefs.get(key)}');
    });
  }

  @override
  void dispose() {
    for (var c in minSponsorControllers) c.dispose();
    for (var c in maxSponsorControllers) c.dispose();
    feedbackController.dispose();
    super.dispose();
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

  Widget buildTextFormField({
    required String labelText,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? hintText,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: maxLines == 1 ? 48 : null,
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText, // ← Tambahkan ini
            hintStyle: grayTextStyle.copyWith(fontSize: 14), // opsional
            labelStyle: grayTextStyle.copyWith(fontSize: 14),
            border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ),
      ),
    );
  }


  Widget feedback(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: buildTextFormField(
        labelText: 'Feedback Kontraprestasi',
        controller: feedbackControllers[index],
        hintText: 'Masukkan feedback terkait kontraprestasi',
        maxLines: 4,
      ),
    );
  }

  Widget buildKontraprestasiForm(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Container(
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
                    onChanged: (val) {
                      kontraprestasiList[index].minSponsor = int.tryParse(val);
                    },
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
                    onChanged: (val) {
                      kontraprestasiList[index].maxSponsor = int.tryParse(val);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        feedback(index),
        Divider(thickness: 1, height: 40),
      ],
    );
  }

  Widget addKontraprestasiButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setState(() {
            kontraprestasiList.add(Kontraprestasi());
            minSponsorControllers.add(TextEditingController());
            maxSponsorControllers.add(TextEditingController());
            feedbackControllers.add(TextEditingController());
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: creamButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: primaryColor),
          ),
        ),
        child: Text(
          'Tambah Kontraprestasi',
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(kontraprestasiList.length, (index) => buildKontraprestasiForm(index)),
        addKontraprestasiButton(),
      ],
    );
  }
}
