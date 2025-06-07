import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pad_fundation/pages/organizer_page/tambah_bukti_kontraprestasi.dart';
import 'package:pad_fundation/theme.dart';

import '../../API/evidence_api.dart';

class UbahBuktiKontraprestasi extends StatefulWidget {
  final int sponsorId;
  final List<BuktiKontraprestasi> initialBuktiList;

  UbahBuktiKontraprestasi({
    required this.sponsorId,
    required this.initialBuktiList,
  });

  @override
  _UbahBuktiKontraprestasiState createState() => _UbahBuktiKontraprestasiState();
}

class _UbahBuktiKontraprestasiState extends State<UbahBuktiKontraprestasi> {
  final ImagePicker _picker = ImagePicker();
  late List<BuktiKontraprestasi> buktiList;

  @override
  void initState() {
    super.initState();
    buktiList = List.from(widget.initialBuktiList);
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
                    'Ubah Bukti Kontraprestasi',
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

  Widget fotoKontraprestasiField(BuktiKontraprestasi bukti) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        controller: bukti.fotoController,
        readOnly: true,
        decoration: InputDecoration(
          labelText: 'Foto Kontraprestasi',
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
          suffixIcon: GestureDetector(
            onTap: () async {
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
              if (image == null) return;

              Uint8List imageBytes = await image.readAsBytes();
              String base64Str = base64.encode(imageBytes);

              setState(() {
                bukti.fotoController.text = image.name;
                bukti.photoBase64 = base64Str;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 0),
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: primaryColor),
                  right: BorderSide(color: primaryColor),
                  bottom: BorderSide(color: primaryColor),
                ),
                color: sageGreen2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  'Unggah',
                  style: greenTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget deskripsiKontraprestasiField(BuktiKontraprestasi bukti) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        controller: bukti.deskripsiController,
        decoration: InputDecoration(
          labelText: 'Deskripsi Kontraprestasi',
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
      ),
    );
  }

  Widget buildBuktiForm(int index, BuktiKontraprestasi bukti) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundyellow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryColor, width: 1),
            ),
            child: Column(
              children: [
                // Foto
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: fotoKontraprestasiField(bukti),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: deskripsiKontraprestasiField(bukti),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: button,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Bukti Kontraprestasi ${index + 1}',
                style: blackTextStyle.copyWith(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tambahBuktiButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 60, top: 10),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setState(() {
            buktiList.add(BuktiKontraprestasi());
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: primaryColor,
              width: 1,
            ),
          ),
        ),
        child: Text(
          'TAMBAH BUKTI KONTRAPRESTASI',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  Future<void> submitAll() async {
    if (widget.sponsorId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sponsor ID belum tersedia.')),
      );
      return;
    }

    try {
      final evidencesPayload = buktiList.map((bukti) {
        final Map<String, dynamic> item = {
          'description': bukti.deskripsiController.text,
          'photo_file': bukti.photoBase64 ?? '',
        };

        if (bukti.id != null) {
          item['id'] = bukti.id;
        }

        return item;
      }).toList();

      await EvidenceApi.upsertEvidences(widget.sponsorId, evidencesPayload);

      showConfirmationDialog(context);
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengirim bukti: $e')),
      );
    }
  }

  Widget nextButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
      width: double.infinity,
      child: TextButton(
        onPressed: submitAll,
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
          'SIMPAN BUKTI KONTRAPRESTASI',
          style: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Kontraprestasi berhasil diperbarui!',
            style: blackTextStyle.copyWith(fontSize: 12),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context, 'refresh');
              },
              child: Text('OK', style: navyTextStyle.copyWith(fontSize: 12)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...buktiList.asMap().entries.map(
                    (entry) => buildBuktiForm(entry.key, entry.value),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: tambahBuktiButton(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: nextButton(),
    );
  }
}

