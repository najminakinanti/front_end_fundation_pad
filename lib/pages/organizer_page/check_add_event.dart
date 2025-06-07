import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/kontraprestasi.dart';

class CheckAddEvent extends StatefulWidget {
  @override
  _CheckAddEventState createState() => _CheckAddEventState();
}

class _CheckAddEventState extends State<CheckAddEvent> {
  String namaEvent = '';
  String statusEvent = '';
  String kategoriEvent = '';
  String targetPartisipan = '';
  String kategoriPartisipan = '';
  String deskripsiEvent = '';
  String gambarEvent = '';

  String tanggalMulai = '';
  String tanggalAkhir = '';
  String venue = '';
  String alamat = '';
  String provinsi = '';
  String kota = '';

  String targetDonasi = '';
  String tenggatDonasi = '';

  List<String> kontraprestasiList = [];

  @override
  void initState() {
    super.initState();
    loadPrefsData();
  }

  Future<void> loadPrefsData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      namaEvent = prefs.getString('nama_event') ?? '';
      statusEvent = prefs.getString('status_event') ?? '';
      kategoriEvent = (prefs.getStringList('kategori_event') ?? []).join(', ');
      targetPartisipan = prefs.getString('jumlah_target') ?? '';
      kategoriPartisipan = prefs.getString('kategori_partisipan') ?? '';
      deskripsiEvent = prefs.getString('deskripsi_event') ?? '';
      gambarEvent = prefs.getString('gambar_event_base64') ?? '';

      tanggalMulai = prefs.getString('tanggal_mulai') ?? '';
      tanggalAkhir = prefs.getString('tanggal_akhir') ?? '';
      venue = prefs.getString('venue_event') ?? '';
      alamat = prefs.getString('alamat_event') ?? '';
      provinsi = prefs.getString('province') ?? '';
      kota = prefs.getString('city') ?? '';

      targetDonasi = prefs.getString('target_donasi_sponsor') ?? '';
      tenggatDonasi = prefs.getString('sponsor_deadline') ?? '';

      final kontraprestasiJson = prefs.getString('kontraprestasi_list') ?? '[]';

      List<dynamic> jsonList = jsonDecode(kontraprestasiJson);
      kontraprestasiList = jsonList.map<String>((e) => e['title']?.toString() ?? '').toList();

      print('=== Data Berhasil Dimuat dari SharedPreferences ===');
      print('Nama Event: $namaEvent');
      print('Status Event: $statusEvent');
      print('Kategori Event: $kategoriEvent');
      print('Target Partisipan: $targetPartisipan');
      print('Kategori Partisipan: $kategoriPartisipan');
      print('Deskripsi Event: $deskripsiEvent');
      print('Gambar Event: $gambarEvent');

      print('Tanggal Mulai: $tanggalMulai');
      print('Tanggal Akhir: $tanggalAkhir');
      print('Venue: $venue');
      print('Alamat: $alamat');
      print('Provinsi: $provinsi');
      print('Kota: $kota');

      print('Target Donasi Sponsor: $targetDonasi');
      print('Tenggat Donasi Sponsor: $tenggatDonasi');

      print('Kontraprestasi:');
      for (var i = 0; i < kontraprestasiList.length; i++) {
        print('- Kontraprestasi ${i + 1}: ${kontraprestasiList[i]}');
      }
      print('===============================================');
    });
  }

  Widget buildReadOnlyField({
      required String labelText,
      required String value,
    }) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        child: TextFormField(
          initialValue: value,
          readOnly: true,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
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
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
        ),
      );
    }

    Widget tanggalEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildReadOnlyField(labelText: 'Tanggal Mulai Event', value: tanggalMulai),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildReadOnlyField(labelText: 'Tanggal Akhir Event', value: tanggalAkhir),
            ),
          ],
        ),
      );
    }

    Widget _buildDataEventSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                buildReadOnlyField(labelText: 'Nama Event', value: namaEvent),
                buildReadOnlyField(labelText: 'Status Event', value: statusEvent),
                buildReadOnlyField(labelText: 'Kategori Event', value: kategoriEvent),
                buildReadOnlyField(labelText: 'Target Partisipan', value: targetPartisipan),
                buildReadOnlyField(labelText: 'Kategori Partisipan', value: kategoriPartisipan),
                buildReadOnlyField(labelText: 'Deskripsi Event', value: deskripsiEvent),
                buildReadOnlyField(labelText: 'Gambar Event', value: gambarEvent),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Event',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDataWaktuTempatSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                tanggalEvent(),
                buildReadOnlyField(labelText: 'Venue Event', value: venue),
                buildReadOnlyField(labelText: 'Provinsi', value: provinsi),
                buildReadOnlyField(labelText: 'Kota', value: kota),
                buildReadOnlyField(labelText: 'Alamat Event', value: alamat),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Tempat dan Waktu',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDataInfoDanaSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                buildReadOnlyField(labelText: 'Target Donasi Sponsor', value: targetDonasi),
                buildReadOnlyField(labelText: 'Tenggat Donasi Sponsor', value: tenggatDonasi),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Informasi Dana',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDataKontraprestasiSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: kontraprestasiList.asMap().entries.map((e) {
                return buildReadOnlyField(
                  labelText: 'Kontraprestasi ${e.key + 1}',
                  value: e.value,
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Kontraprestasi',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildDataEventSection(),
        _buildDataWaktuTempatSection(),
        _buildDataInfoDanaSection(),
        _buildDataKontraprestasiSection(),
      ],
    );
  }
}
