import 'package:flutter/material.dart';
import 'package:pad_fundation/API/auth_api.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMitra extends StatefulWidget {
  @override
  _AddMitraState createState() => _AddMitraState();
}

class _AddMitraState extends State<AddMitra> {
  final TextEditingController nameMitraController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedProvince;
  String? selectedCity;
  // File? _imageFile;

  List<String> provinces = ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur'];
  Map<String, List<String>> cities = {
    'Jawa Barat': ['Bandung', 'Bogor', 'Bekasi'],
    'Jawa Tengah': ['Semarang', 'Solo', 'Magelang'],
    'Jawa Timur': ['Surabaya', 'Malang', 'Kediri'],
  };

  // Data dari halaman pertama
  String? name;
  String? email;
  String? phone;
  String? password;

  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Future<void> _loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      phone = prefs.getString('phone');
      password = prefs.getString('password');
    });
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameMitraController.text);
    await prefs.setString('address', addressController.text);
    await prefs.setString('description', descriptionController.text);
    await prefs.setString('province', selectedProvince ?? '');
    await prefs.setString('city', selectedCity ?? '');

    Map<String, String> finalData = {
      "name": name ?? '',
      "email": email ?? '',
      "phone": phone ?? '',
      "password": password ?? '',
      "mitra_name": nameMitraController.text,
      "address": addressController.text,
      "province": selectedProvince ?? '',
      "city": selectedCity ?? '',
      "description": descriptionController.text,
    };

    // Simulasikan pengiriman data (gantilah ini dengan API request jika diperlukan)
    print("Data dikirim: $finalData");

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data berhasil disimpan!")),
      );
    }
  }

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: Image.asset(
                  'assets/icon_panah_kiri.png',
                  width: 8,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tambah Mitra Industri',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Untuk membuat akun, Isi data berikut',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget processLine() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(-1.0, 1.0),
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: lineColor2,
              valueColor: AlwaysStoppedAnimation<Color>(lineColor),
              minHeight: 5,
            ),
          ),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Data Mitra',
          style: greenTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget nameMitraInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: nameMitraController,
                decoration: InputDecoration(
                  labelText: 'Nama Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
        margin: EdgeInsets.only(top: 18),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Provinsi Mitra',
            labelStyle: grayTextStyle.copyWith(fontSize: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset('assets/icon_location.png', width: 15, height: 15),
            ),
          ),
          value: selectedProvince,
          items: provinces.map((String province) {
            return DropdownMenuItem<String>(
              value: province,
              child: Text(province, style: grayTextStyle.copyWith(fontSize: 12)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedProvince = newValue;
              selectedCity = null; // Reset kota saat provinsi berubah
            });
          },
        ),
      );
    }

    Widget cityInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Kota',
            labelStyle: grayTextStyle.copyWith(fontSize: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset('assets/icon_location.png', width: 15, height: 15),
            ),
          ),
          value: selectedCity,
          items: selectedProvince != null
              ? cities[selectedProvince!]!.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city, style: grayTextStyle.copyWith(fontSize: 12)),
            );
          }).toList()
              : [],
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue;
            });
          },
        ),
      );
    }

    Widget completeAddressInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat lengkap Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(fontSize: 16),
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/icon_location.png',
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

    Widget pictureInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Gambar Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(
                    fontSize: 16,
                  ),
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      //
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

    Widget descriptionInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Mitra Industri',
                  labelStyle: grayTextStyle.copyWith(
                      fontSize: 16
                  ),
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
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget twoButtonRow() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 30, top: 30),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: sageGreen3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'SEBELUMNYA',
                  style: whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () {
                  AuthApi.registerMitra(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'SIMPAN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title(),
                        ],
                      ),
                    ),
                    processLine(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitle(),
                          nameMitraInput(),
                          provinceInput(),
                          cityInput(),
                          completeAddressInput(),
                          pictureInput(),
                          descriptionInput(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: twoButtonRow(),
            ),
          ],
        ),
      ),
    );
  }
}