import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class FileAddEvent extends StatefulWidget {
  @override
  _FileAddEventState createState() => _FileAddEventState();
}

class _FileAddEventState extends State<FileAddEvent> {
  String selectedStatus = 'aktif';
  String selectedCategory = 'kategorinya';
  String selectedParticipant = 'bokap bokap';

  void onStatusChanged(String? newStatus) {
    setState(() {
      selectedStatus = newStatus!;
    });
  }
  void onCategoryChanged(String? newCategory){
    setState(() {
      selectedCategory = newCategory!;
    });
  }
  void onParticipantChanged(String? newParticipant) {
    setState(() {
      selectedParticipant = newParticipant!;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget buildTextFormField({
      required String labelText,
      required String hintText,
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
              hintStyle: grayTextStyle.copyWith(fontSize: 14),
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

    Widget namaEvent() {
      return buildTextFormField(
          labelText: 'Nama Event',
          hintText: 'Masukan nama event'
      );
    }

    Widget statusEvent({
      required String? selectedStatus,
      required ValueChanged<String?> onStatusChanged,
    }) {
      List<String> statuses = ['aktif', 'yakali', 'gak'];

      return buildDropdownTextFormField(
        labelText: 'Status Event',
        hintText: 'Pilih status event',
        dropdownItems: statuses,
        selectedValue: selectedStatus,
        onChanged: onStatusChanged,
      );
    }

    Widget kategoriEvent({
      required String? selectedCategory,
      required ValueChanged<String?> onCategoryChanged,
    }) {
      List<String> categories = ['kategorinya', 'ada', 'apa', 'aja'];

      return buildDropdownTextFormField(
        labelText: 'Kategori Event',
        hintText: 'Pilih kategori event',
        dropdownItems: categories,
        selectedValue: selectedCategory,
        onChanged: onCategoryChanged,
      );
    }

    Widget jumlahTarget() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Target Partisipan',
          hintText: 'Jumlah target',
        ),
      );
    }

    Widget kategoriPartisipan({
      required String? selectedParticipant,
      required ValueChanged<String?> onParticipantChanged,
    }) {
      List<String> participant = ['bokap bokap', 'abang abang', 'nenek nenek'];

      return buildDropdownTextFormField(
        labelText: 'Kategori Partisipan',
        hintText: 'Pilih kategori partisipan',
        dropdownItems: participant,
        selectedValue: selectedParticipant,
        onChanged: onParticipantChanged,
      );
    }

    Widget detailPartisipan() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Detail Partisipan',
          hintText: 'Isi detail partisipan',
        ),
      );
    }

    Widget deskripsiEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Deskripsi Event',
          hintText: 'Isi deskripsi event',
        ),
      );
    }

    Widget pictureInput() {
      TextEditingController nominalController = TextEditingController();

      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Gambar Event',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  hintText: 'Masukkan Gambar Event',
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
                    onTap: () {},
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
            ),
          ],
        ),
      );
    }

    Widget pictureDetailInfo() {
      TextEditingController nominalController = TextEditingController();

      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nominalController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Gambar Detail Informasi',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  hintText: 'Masukkan Gambar Detail Informasi',
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
                    onTap: () {},
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
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        namaEvent(),
        statusEvent(selectedStatus: null, onStatusChanged: onStatusChanged),
        kategoriEvent(selectedCategory: null, onCategoryChanged: onCategoryChanged),
        jumlahTarget(),
        kategoriPartisipan(selectedParticipant: null, onParticipantChanged: onParticipantChanged),
        detailPartisipan(),
        deskripsiEvent(),
        pictureInput(),
        pictureDetailInfo(),
      ],
    );
  }
}
