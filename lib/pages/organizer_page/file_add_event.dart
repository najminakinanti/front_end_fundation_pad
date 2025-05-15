import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pad_fundation/theme.dart';


class FileAddEvent extends StatefulWidget {
  @override
  _FileAddEventState createState() => _FileAddEventState();
}

class _FileAddEventState extends State<FileAddEvent> {
  String selectedStatus = 'aktif';
  String selectedCategory = 'kategorinya';
  final TextEditingController _imageController = TextEditingController();
  String? photo_file;

  List<File> _detailImageFiles = [];
  List<String> _detailPhotoBase64 = [];
  TextEditingController _detailImagesController = TextEditingController();

  List<String> selectedCategories = [];
  final TextEditingController _categoryController = TextEditingController();

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

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

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

  void _pickMultipleImagesBase64() async {
    final List<XFile>? images = await _picker.pickMultiImage();

    // ✅ Tambahkan print ini
    print('Gambar dipilih: ${images?.length ?? 0}');

    if (images == null || images.isEmpty) return;

    List<File> tempFiles = [];
    List<String> tempBase64 = [];

    for (var image in images) {
      Uint8List bytes = await image.readAsBytes();
      String base64String = base64.encode(bytes);
      tempFiles.add(File(image.path));
      tempBase64.add(base64String);
    }

    setState(() {
      _detailImageFiles = tempFiles;
      _detailPhotoBase64 = tempBase64;
      _detailImagesController.text = _detailImageFiles.length == 1
          ? '1 gambar terpilih'
          : '${_detailImageFiles.length} gambar terpilih';
    });

    print('Jumlah gambar detail: ${_detailImageFiles.length}');
  }

  void _showCategoryMultiSelectDialog(BuildContext context) {
    List<String> allCategories = ['kategorinya', 'ada', 'apa', 'aja'];
    List<String> tempSelected = List.from(selectedCategories);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Pilih Kategori'),
              content: SingleChildScrollView(
                child: Column(
                  children: allCategories.map((category) {
                    return CheckboxListTile(
                      title: Text(category),
                      value: tempSelected.contains(category),
                      onChanged: (bool? checked) {
                        setStateDialog(() {
                          if (checked == true) {
                            tempSelected.add(category);
                          } else {
                            tempSelected.remove(category);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategories = tempSelected;
                      _categoryController.text = selectedCategories.join(', ');
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Pilih'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
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
      List<String> statuses = ['ONLINE', 'OFFLINE'];

      return buildDropdownTextFormField(
        labelText: 'Status Event',
        hintText: 'Pilih status event',
        dropdownItems: statuses,
        selectedValue: selectedStatus,
        onChanged: onStatusChanged,
      );
    }

    Widget kategoriEventMulti() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            _showCategoryMultiSelectDialog(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Kategori Event',
                hintText: 'Pilih kategori event',
                labelStyle: grayTextStyle.copyWith(fontSize: 14),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
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

    Widget kategoriPartisipan() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Kategori Partisipan',
          hintText: 'Isi kategori partisipan',
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

      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: _imageController,
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
                    onTap: () {
                      _pickImageBase64();
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
                controller: _detailImagesController,
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
                    onTap: () {
                      _pickMultipleImagesBase64();
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
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        namaEvent(),
        statusEvent(selectedStatus: null, onStatusChanged: onStatusChanged),
        kategoriEventMulti(),
        // kategoriEvent(selectedCategory: null, onCategoryChanged: onCategoryChanged),
        jumlahTarget(),
        kategoriPartisipan(),
        deskripsiEvent(),
        pictureInput(),
        pictureDetailInfo(),
      ],
    );
  }
}
