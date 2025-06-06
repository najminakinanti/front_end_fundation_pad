import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme.dart';
import '../../API/location_api.dart';
import '../../API/profile_api.dart';

class EditMitra extends StatefulWidget {
  @override
  _EditMitraState createState() => _EditMitraState();
}

class _EditMitraState extends State<EditMitra> {
  final TextEditingController _imageController = TextEditingController();
  late TextEditingController mitraNameController;
  late TextEditingController addressController;
  late TextEditingController descriptionController;
  Map<String, dynamic>? _mitraProfile;
  String? user_id;

  String? mitraName, address, description, province, city, photo_file;
  String? photo_file_base64;
  File? _imageFile;
  Uint8List? _imageBytes;
  final ImagePicker _picker = ImagePicker();
  List<String> provinces = [];
  List<String> cities = [];
  String? selectedProvince;
  bool isLoadingProvinces = true;
  // String? province;
  String? selectedCity;

  void _pickImageBase64() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    Uint8List imagebyte = await image.readAsBytes();
    String _base64 = base64.encode(imagebyte);

    final imagetamppath = File(image.path);

    setState(() {
      _imageController.text = image.name;
      _imageFile = imagetamppath;
      photo_file = ''; // kosongkan URL supaya preview dari local
      photo_file_base64 = _base64; // kalau kamu simpan base64 juga, opsional
    });

    print('Base64 image: $_base64');
  }

  Future<void> _loadMitraFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userIdString = prefs.getString('user_id');

    if (token != null && userIdString != null) {
      int userId = int.parse(userIdString);
      user_id = userIdString;

      final mitraData = await ProfileApi.getMitraProfile(userId, token);
      if (mitraData != null  && mounted ) {
        print('Mitra Data: $mitraData');

        // Simpan data ke dalam state
        setState(() {
          _mitraProfile = mitraData;
          mitraName = mitraData['data']['name'];
          address = mitraData['data']['address'];
          description = mitraData['data']['description'];
          province = mitraData['data']['province'];
          city = mitraData['data']['city'];
          photo_file = mitraData['data']['photo_file'];

          // set controller values
          mitraNameController.text = mitraName ?? '';
          addressController.text = address ?? '';
          descriptionController.text = description ?? '';
          _imageController.text = photo_file ?? '';
        });
        print('Photo file path: $photo_file');
      }
    } else {
      print('Token atau User ID tidak ditemukan');
    }
  }

  Future<void> _loadProvinces() async {
    try {
      final data = await LocationApi.fetchProvinces();
      final loadedProvinces = data.map((item) => item['province'].toString()).toList();

      setState(() {
        provinces = loadedProvinces;
        selectedProvince = province != null && loadedProvinces.contains(province)
            ? province
            : (loadedProvinces.isNotEmpty ? loadedProvinces[0] : null);
      });
    } catch (e) {
      print('Gagal memuat provinsi: $e');
    }
  }

  Future<void> _loadCities(String provinceName, [String? selectedCityFromApi]) async {
    try {
      final data = await LocationApi.fetchCities(provinceName);
      final loadedCities = data.map((item) => item['district'].toString()).toList();

      setState(() {
        cities = loadedCities;
        if (selectedCityFromApi != null && loadedCities.contains(selectedCityFromApi)) {
          selectedCity = selectedCityFromApi;
        } else {
          selectedCity = null;
        }
      });
      print("Cities loaded: $cities");
    } catch (e) {
      print('Gagal memuat kota: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    mitraNameController = TextEditingController();
    addressController = TextEditingController();
    descriptionController = TextEditingController();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _loadMitraFromApi();
    await _loadProvinces();
    if (selectedProvince != null) {
      await _loadCities(selectedProvince!, city);
    }
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && user_id != null) {
      Map<String, dynamic> dataToUpdate = {
        "name": mitraNameController.text,
        "description": descriptionController.text,
        "address": addressController.text,
        "city": selectedCity ?? "",
        "province": selectedProvince ?? "",
        "photo_file": photo_file_base64 != null && photo_file_base64!.isNotEmpty
            ? photo_file_base64
            : (photo_file ?? ""),
      };

      // Print data yang akan dikirim
      print('Data yang dikirim ke API: $dataToUpdate');

      // Panggil fungsi update mitra
      bool success = await ProfileApi.putMitraProfile(int.parse(user_id!), token, dataToUpdate);

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profil mitra berhasil diperbarui')),
        );
        Navigator.pushNamed(context, '/home-mitra', arguments: 3);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memperbarui profil mitra')),
        );
      }
    } else {
      print("Token atau userId null");
    }
  }


  @override
  Widget build(BuildContext context) {

    Widget buildPreviewImage() {
      if (_imageFile != null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.file(
            _imageFile!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        );
      } else if
      (photo_file != null && photo_file!.isNotEmpty) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            '${ProfileApi.photourl}${photo_file!}',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/img_chat3.png',
                width: 80,
                height: 80,
              );
            },
          ),
        );
      } else {
        return Image.asset(
          'assets/img_profile_picture.png',
          width: 80,
          height: 80,
        );
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, defaultMargin, 0),
        child: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icon_panah_kiri.png',
                  width: 15,
                  height: 15,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Ubah Data Mitra',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          flexibleSpace: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: kToolbarHeight + 25),
                // Ganti Image.asset dengan preview gambar yang dinamis
                buildPreviewImage(),
                SizedBox(height: 10),
                Text(
                  'Mitra Industri',
                  style: lighGrayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: 80,
        ),
      );
    }

    Widget namaInput() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: mitraNameController,
                decoration: InputDecoration(
                  labelText: 'Nama Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget provinceInput() {
      return Container(
        margin: EdgeInsets.only(top: 18, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 53,
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Provinsi Mitra',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor,),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor,),),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor,),),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset('assets/icon_location.png', width: 15, height: 15,),
                  ),
                ),
                value: selectedProvince,
                items: provinces.map((String province) {
                  return DropdownMenuItem<String>(
                    value: province,
                    child: Text(
                      province,
                      style: grayTextStyle.copyWith(fontSize: 15),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedProvince = newValue;
                      selectedCity = null;
                    });
                    _loadCities(newValue);
                  }
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget cityInput() {
      return Container(
        margin: EdgeInsets.only(top: 18, left: 30, right: 30),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Kota Mitra',
                labelStyle: grayTextStyle.copyWith(fontSize: 14),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    'assets/icon_location.png',
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              value: selectedCity != null && cities.contains(selectedCity) ? selectedCity : null,
              items: cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(
                    city,
                    style: grayTextStyle.copyWith(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
            ),
          ],
        ),
      );
    }

    Widget alamatInput() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat Lengkap',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icon_pin.png',
                        width: 15,
                        height: 15,
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

    Widget pictureInput() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'Gambar Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _pickImageBase64();
                    },
                    child: Container(
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

    Widget deskripsiInput() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
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

    Widget simpanButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 60),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            _saveProfile();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'SIMPAN',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              namaInput(),
              provinceInput(),
              cityInput(),
              alamatInput(),
              pictureInput(),
              deskripsiInput(),
              simpanButton(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}