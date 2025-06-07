import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pad_fundation/API/evidence_api.dart';
import 'package:pad_fundation/theme.dart';

import '../../models/kontraprestasi_evidences.dart';

class TambahBuktiKontraprestasi extends StatefulWidget {
  @override
  _TambahBuktiKontraprestasiState createState() => _TambahBuktiKontraprestasiState();
}

class _TambahBuktiKontraprestasiState extends State<TambahBuktiKontraprestasi> {
  int? sponsorId;
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  String? photo_file;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  List<BuktiKontraprestasi> buktiList = [BuktiKontraprestasi()];

  void _pickImageBase64() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image == null) return;

    Uint8List imagebyte = await image!.readAsBytes();
    String _base64 = base64.encode(imagebyte);

    print(_base64);

    final imagetamppath = File(image.path);

    setState(() {
      _imageController.text = image.name;
      this._imageFile = imagetamppath;
      photo_file = _base64;
    });

    print(imagetamppath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map) {
      sponsorId = args['sponsorId'] ?? 0;
    } else if (args != null && args is int) {
      sponsorId = args;
    } else {
      sponsorId = 0;
    }
  }


  Future<void> submitEvidences() async {
    if (sponsorId == null || sponsorId == 0) {
      print('Sponsor ID belum di-set');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sponsor ID belum tersedia.')),
      );
      return;
    }

    try {
      print('Sponsor ID: $sponsorId');

      List<Map<String, dynamic>> evidencesData = buktiList.map((bukti) {
        return {
          "photo_file": bukti.photoBase64 ?? '',
          "description": bukti.deskripsiController.text,
        };
      }).toList();

      await EvidenceApi.addEvidencesBySponsorId(sponsorId!, evidencesData);
      showConfirmationDialog(context);
    } catch (e) {
      print('Error submit evidences: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengirim bukti: $e')),
      );
    }
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
                    child: Image.asset('assets/icon_panah_kiri.png', width: 8),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Tambah Bukti Kontraprestasi',
                    style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fotoKontraprestasi(BuktiKontraprestasi bukti) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: bukti.fotoController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Foto Kontraprestasi',
                labelStyle: grayTextStyle.copyWith(fontSize: 14),
                hintText: 'Masukkan foto',
                hintStyle: grayTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
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

                    final imageFile = File(image.path);
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
                    child: Center(child: Text('Unggah', style: greenTextStyle)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget fotoKontraprestasi() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 10),
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: 48,
  //           child: TextFormField(
  //             controller: _imageController,
  //             readOnly: true,
  //             decoration: InputDecoration(
  //               labelText: 'Foto Kontraprestasi',
  //               labelStyle: grayTextStyle.copyWith(fontSize: 14),
  //               hintText: 'Masukkan foto',
  //               hintStyle: grayTextStyle.copyWith(
  //                 fontSize: 14,
  //                 fontWeight: regular,
  //               ),
  //               border: OutlineInputBorder(
  //                 borderSide: BorderSide(color: primaryColor),
  //               ),
  //               enabledBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: primaryColor),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: primaryColor),
  //               ),
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
  //               suffixIcon: GestureDetector(
  //                 onTap: () {
  //                   _pickImageBase64();
  //                 },
  //                 child: Container(
  //                   margin: EdgeInsets.only(right: 0),
  //                   width: 80,
  //                   height: 40,
  //                   decoration: BoxDecoration(
  //                     border: Border(
  //                       top: BorderSide(color: primaryColor),
  //                       right: BorderSide(color: primaryColor),
  //                       bottom: BorderSide(color: primaryColor),
  //                     ),
  //                     color: sageGreen2,
  //                     borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(5),
  //                       bottomRight: Radius.circular(5),
  //                     ),
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       'Unggah',
  //                       style: greenTextStyle.copyWith(
  //                         fontSize: 14,
  //                         fontWeight: regular,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget deskripsiKontraprestasi(BuktiKontraprestasi bukti) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: bukti.deskripsiController,
              decoration: InputDecoration(
                labelText: 'Deskripsi Kontraprestasi',
                labelStyle: grayTextStyle.copyWith(fontSize: 14),
                hintText: 'Masukkan Deskripsi Kontraprestasi',
                hintStyle: grayTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
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
          ),
        ],
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
                    fotoKontraprestasi(bukti), // <--- Beri param
                    deskripsiKontraprestasi(bukti), // <--- Beri param
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
                color: sageGreen3,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Bukti Kontraprestasi ${index + 1}',
                style: whiteTextStyle.copyWith(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tambahBuktiButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Container(
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
              side: BorderSide(color: primaryColor, width: 1),
            ),
          ),
          child: Text(
            'TAMBAH BUKTI KONTRAPRESTASI',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          submitEvidences();
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: primaryColor),
          ),
        ),
        child: Text(
          'SIMPAN BUKTI KONTRAPRESTASI',
          style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: bold),
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
            'Kontraprestasi berhasil ditambahkan!',
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
              ...buktiList
                  .asMap()
                  .entries
                  .map((entry) => buildBuktiForm(entry.key, entry.value))
                  .toList(),
              tambahBuktiButton(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: nextButton(),
    );
  }
}

class BuktiKontraprestasi {
  TextEditingController fotoController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  String? photoBase64;
}

