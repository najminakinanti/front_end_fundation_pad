import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../models/kontraprestasi.dart';

class EditKontraprestasi extends StatefulWidget {
  final Kontraprestasi kontraprestasi;

  const EditKontraprestasi({Key? key, required this.kontraprestasi}) : super(key: key);

  @override
  _EditKontraprestasiState createState() => _EditKontraprestasiState();
}

class _EditKontraprestasiState extends State<EditKontraprestasi> {
  late String selectedIcon;
  late TextEditingController minSponsorController;
  late TextEditingController maxSponsorController;
  late TextEditingController feedbackController;

  // Tambahkan controller untuk title jika perlu
  late TextEditingController titleController;

  final Map<String, int> iconNameToId = {
    'platinum': 1,
    'diamond': 2,
    'gold': 3,
    'silver': 4,
    'bronze': 5,
  };

  final List<String> iconOptions = ['Platinum', 'Diamond', 'Gold', 'Silver', 'Bronze'];

  @override
  void initState() {
    super.initState();

    String key = iconNameToId.entries
        .firstWhere(
          (entry) => entry.value == widget.kontraprestasi.iconPhotoKontraprestasisId,
      orElse: () => MapEntry('Gold', 3),
    )
        .key;

    selectedIcon = key.isNotEmpty ? key[0].toUpperCase() + key.substring(1) : key;

    minSponsorController = TextEditingController(text: (widget.kontraprestasi.minSponsor ?? 0).toString());
    maxSponsorController = TextEditingController(text: (widget.kontraprestasi.maxSponsor ?? 0).toString());
    feedbackController = TextEditingController(text: widget.kontraprestasi.feedback ?? '');

    titleController = TextEditingController(text: widget.kontraprestasi.title ?? '');
  }

  @override
  void dispose() {
    minSponsorController.dispose();
    maxSponsorController.dispose();
    feedbackController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void onIconChanged(String? val) {
    if (val != null) setState(() => selectedIcon = val);
  }

  Future<void> saveKontraprestasi() async {
    print('saveKontraprestasi dipanggil');

    final prefs = await SharedPreferences.getInstance();

    // Ambil list JSON dari SharedPreferences
    String? jsonString = prefs.getString('kontraprestasi_list');
    List<dynamic> jsonList = [];

    if (jsonString != null) {
      try {
        jsonList = jsonDecode(jsonString);
      } catch (e) {
        print('Error decoding kontraprestasi_list: $e');
        // Kalau error decode, reset list jadi kosong
        jsonList = [];
      }
    }

    final kontraprestasiId = widget.kontraprestasi.id;

    if (kontraprestasiId == null) {
      print('Error: ID tidak ditemukan, tidak bisa menyimpan.');
      // Bisa tampilkan dialog error di sini jika perlu
      return;
    }

    int iconId = iconNameToId[selectedIcon.toLowerCase()] ?? 3;

    // Data yang akan disimpan / diupdate
    Map<String, dynamic> updatedItem = {
      'id': kontraprestasiId,
      'title': titleController.text.trim(),  // Ambil dari inputan judul
      'min_sponsor': int.tryParse(minSponsorController.text) ?? 0,
      'max_sponsor': int.tryParse(maxSponsorController.text) ?? 0,
      'icon_photo_kontraprestasis_id': iconId,
      'feedback': feedbackController.text.trim(),
      'events_id': widget.kontraprestasi.eventsId,
    };

    // Cari index berdasarkan id
    int index = jsonList.indexWhere((element) => element['id'] == kontraprestasiId);

    if (index != -1) {
      // Update item existing
      jsonList[index] = updatedItem;
    } else {
      // Kalau tidak ditemukan, tambah item baru
      jsonList.add(updatedItem);
    }

    // Simpan kembali ke SharedPreferences
    await prefs.setString('kontraprestasi_list', jsonEncode(jsonList));

    // Tampilkan dialog konfirmasi
    showConfirmationDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildDropdownTextFormField({
      required String labelText,
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
              border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular)),
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget buildTextFormField({
      required String labelText,
      required TextEditingController controller,
      int maxLines = 1,
      TextInputType? keyboardType,
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
                      onTap: () => Navigator.pop(context),
                      child: Image.asset('assets/icon_panah_kiri.png', width: 8),
                    ),
                    SizedBox(width: 20),
                    Text('Ubah Kontraprestasi',
                        style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget iconKontraprestasi() {
      return buildDropdownTextFormField(
        labelText: 'Ikon Kontraprestasi',
        dropdownItems: iconOptions,
        selectedValue: selectedIcon,
        onChanged: onIconChanged,
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
                controller: minSponsorController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildTextFormField(
                labelText: 'Maksimal Sponsor',
                controller: maxSponsorController,
                keyboardType: TextInputType.number,
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
          controller: feedbackController,
          maxLines: 4,
        ),
      );
    }

    Widget saveButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: saveKontraprestasi,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            'SIMPAN PERUBAHAN',
            style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          iconKontraprestasi(),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.pop(context, 'refresh'); // Kembali ke halaman sebelumnya dengan tanda refresh
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
