import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme.dart';
import '../../API/profile_api.dart';

class UbahDataProfileOrganizer extends StatefulWidget {
  @override
  _UbahDataProfileOrganizerState createState() => _UbahDataProfileOrganizerState();
}

class _UbahDataProfileOrganizerState extends State<UbahDataProfileOrganizer> {
  Map<String, dynamic>? _userProfile;
  String? userId;

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    _loadProfileFromApi();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _loadProfileFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userIdString = prefs.getString('user_id');

    if (token != null && userIdString != null) {
      userId = userIdString;

      final userData = await ProfileApi.getUserProfile(int.parse(userIdString), token);
      if (userData != null) {
        setState(() {
          _userProfile = userData;
          fullNameController.text = userData['data']['full_name'] ?? '';
          emailController.text = userData['data']['email'] ?? '';
          phoneController.text = userData['data']['phone'] ?? '';
        });
      }
    }
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && userId != null) {
      Map<String, dynamic> dataToUpdate = {
        "full_name": fullNameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
      };

      // Print data yang akan dikirim
      print('Data yang dikirim ke API: $dataToUpdate');

      bool success = await ProfileApi.putUserForm(userId!, token, dataToUpdate);

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile berhasil diperbarui')),
        );
        Navigator.pushNamed(context, '/home-organizer', arguments: 3);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memperbarui profile')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 10, defaultMargin, 0),
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
                'Ubah Data Profile',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                _saveProfile();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Image.asset(
                  'assets/icon_check.png',
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nama() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
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
            ),
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
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
            ),
          ],
        ),
      );
    }

    Widget telp() {

      return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telephone',
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
            ),
          ],
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
              nama(),
              email(),
              telp(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}