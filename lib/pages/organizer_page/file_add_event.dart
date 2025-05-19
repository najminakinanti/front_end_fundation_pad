import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileAddEvent extends StatefulWidget {
  const FileAddEvent({Key? key}) : super(key: key);

  @override
  FileAddEventState createState() => FileAddEventState();
}

class FileAddEventState extends State<FileAddEvent> {

  final List<Map<String, dynamic>> categoryOptions = [
    {'id': '1', 'name': 'Kuliner'},
    {'id': '2', 'name': 'Festival'},
    {'id': '3', 'name': 'Pendidikan'},
    {'id': '4', 'name': 'Seniman'},
  ];


  final TextEditingController _namaEventController = TextEditingController();
  final TextEditingController _jumlahTargetController = TextEditingController();
  final TextEditingController _kategoriPartisipanController = TextEditingController();
  final TextEditingController _deskripsiEventController = TextEditingController();

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
    List<String> tempSelectedIds = List.from(selectedCategories); // will hold IDs

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Pilih Kategori'),
              content: SingleChildScrollView(
                child: Column(
                  children: categoryOptions.map((category) {
                    return CheckboxListTile(
                      title: Text(category['name']),
                      value: tempSelectedIds.contains(category['id']),
                      onChanged: (bool? checked) {
                        setStateDialog(() {
                          if (checked == true) {
                            tempSelectedIds.add(category['id']);
                          } else {
                            tempSelectedIds.remove(category['id']);
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
                      selectedCategories = tempSelectedIds;

                      // Untuk tampilan, ubah ID ke nama
                      _categoryController.text = categoryOptions
                          .where((category) => selectedCategories.contains(category['id']))
                          .map((e) => e['name'])
                          .join(', ');
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

  Future<void> saveEventDataToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('nama_event', _namaEventController.text);
    await prefs.setString('status_event', selectedStatus);
    await prefs.setStringList('kategori_event', selectedCategories);
    await prefs.setString('jumlah_target', _jumlahTargetController.text);
    await prefs.setString('kategori_partisipan', _kategoriPartisipanController.text);
    await prefs.setString('deskripsi_event', _deskripsiEventController.text);
    await prefs.setString('gambar_event_base64', photo_file ?? '');
    await prefs.setStringList('gambar_detail_base64', _detailPhotoBase64);

    // ✅ Verifikasi: Baca ulang dan print
    print('=== Data Disimpan di SharedPreferences ===');
    print('Nama Event: ${prefs.getString('nama_event')}');
    print('Status: ${prefs.getString('status_event')}');
    print('Kategori: ${prefs.getStringList('kategori_event')}');
    print('Jumlah Target: ${prefs.getString('jumlah_target')}');
    print('Kategori Partisipan: ${prefs.getString('kategori_partisipan')}');
    print('Deskripsi: ${prefs.getString('deskripsi_event')}');
    print('Gambar Base64: ${prefs.getString('gambar_event_base64')?.substring(0, 20)}...'); // Print sebagian saja
    print('Jumlah Detail Gambar: ${prefs.getStringList('gambar_detail_base64')?.length}');
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
      TextEditingController? controller,
      TextInputType? keyboardType,
      List<TextInputFormatter>? inputFormatters,

    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
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
          hintText: 'Masukkan nama event',
          controller: _namaEventController,
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

    Widget jumlahTarget() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Target Partisipan',
          hintText: 'Jumlah target',
          controller: _jumlahTargetController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      );
    }

    Widget kategoriPartisipan() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Kategori Partisipan',
          hintText: 'Isi kategori partisipan',
          controller: _kategoriPartisipanController,
        ),
      );
    }

    Widget deskripsiEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Deskripsi Event',
          hintText: 'Isi deskripsi event',
          controller: _deskripsiEventController,
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
        jumlahTarget(),
        kategoriPartisipan(),
        deskripsiEvent(),
        pictureInput(),
        pictureDetailInfo(),
      ],
    );
  }
}
