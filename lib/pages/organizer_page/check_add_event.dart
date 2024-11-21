import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class CheckAddEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
              child: buildReadOnlyField(labelText: 'Tanggal Mulai Event', value: '2024-11-19'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildReadOnlyField(labelText: 'Tanggal Akhir Event', value: '2024-11-20'),
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
                buildReadOnlyField(labelText: 'Nama Event', value: 'Mufest'),
                buildReadOnlyField(labelText: 'Jenis Event', value: 'apa'),
                buildReadOnlyField(labelText: 'Status Event', value: 'aktif'),
                buildReadOnlyField(labelText: 'Kategori Event', value: 'kategorinya'),
                buildReadOnlyField(labelText: 'Target Partisipan', value: '100000'),
                buildReadOnlyField(labelText: 'Kategori Partisipan', value: 'bokap bokap'),
                buildReadOnlyField(labelText: 'Detail Partisipan', value: 'detail partisipan tu masudnya apa deh blm kepikir'),
                buildReadOnlyField(labelText: 'Deskripsi Event', value: 'ini belum, gimana ya bikin kotaknya jadi lebar'),
                buildReadOnlyField(labelText: 'Gambar Organizer', value: 'WhatsApp Image 2024-11-08'),
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
                buildReadOnlyField(labelText: 'Venue Event', value: 'di hatimu'),
                buildReadOnlyField(labelText: 'Provinsi', value: 'Jawa Barat'),
                buildReadOnlyField(labelText: 'Kota', value: 'Bogor'),
                buildReadOnlyField(labelText: 'Alamat Event', value: 'Jalan Padjajaran'),
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
                buildReadOnlyField(labelText: 'Target Donasi Sponsor', value: '50.000.000'),
                buildReadOnlyField(labelText: 'Tenggat Donasi Sponsor', value: '2024-10-19'),
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
              children: [
                buildReadOnlyField(labelText: 'Kontraprestasi 1', value: 'emas'),
                buildReadOnlyField(labelText: 'Kontrapresrasi 2', value: 'perak'),
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
