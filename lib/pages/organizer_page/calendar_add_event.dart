import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/location_api.dart';

class CalendarAddEvent extends StatefulWidget {
  CalendarAddEvent({Key? key}) : super(key: key);

  @override
  CalendarAddEventState createState() => CalendarAddEventState();
}

class CalendarAddEventState extends State<CalendarAddEvent> {
  String? selectedProvince;
  String? selectedCity;
  List<String> provinces = [];
  List<String> cities = [];

  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalAkhirController = TextEditingController();


  DateTime? _tanggalMulai;
  DateTime? _tanggalAkhir;

  void _loadProvinces() async {
    try {
      final data = await LocationApi.fetchProvinces(); // ← pastikan kamu punya class LocationApi
      setState(() {
        provinces = data.map((item) => item['province'].toString()).toList();
      });
      print("Provinces loaded: $provinces");
    } catch (e) {
      print('Gagal memuat provinsi: $e');
    }
  }

  void _loadCities(String provinceName) async {
    try {
      final data = await LocationApi.fetchCities(provinceName);
      setState(() {
        cities = data.map((item) => item['district'].toString()).toList();
      });
      print("Cities loaded: $cities");
    } catch (e) {
      print('Gagal memuat kota: $e');
    }
  }

  Future<void> saveEventDateToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('venue_event', _venueController.text);
    await prefs.setString('alamat_event', _alamatController.text);
    await prefs.setString('province', selectedProvince ?? '');
    await prefs.setString('city', selectedCity ?? '');
    if (_tanggalMulai != null) {
      await prefs.setString('tanggal_mulai', _tanggalMulai.toString());
    }
    if (_tanggalAkhir != null) {
      await prefs.setString('tanggal_akhir', _tanggalAkhir.toString());
    }

    // Debug print
    print('=== Data Kalender Disimpan ===');
    print('Venue: ${prefs.getString('venue_event')}');
    print('Alamat: ${prefs.getString('alamat_event')}');
    print('Provinsi: ${prefs.getString('province')}');
    print('Kota: ${prefs.getString('city')}');
    print('Tanggal Mulai: ${prefs.getString('tanggal_mulai')}');
    print('Tanggal Akhir: ${prefs.getString('tanggal_akhir')}');
  }

  @override
  void initState() {
    super.initState();
    _loadProvinces();
  }

  @override
  Widget build(BuildContext context) {

    Widget buildDateFormField({
      required String labelText,
      required String hintText,
      required BuildContext context,
      required TextEditingController controller,
      required Function(DateTime?) onDateSelected,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                controller.text = "${pickedDate.toLocal()}".split(' ')[0];
                onDateSelected(pickedDate);
              }
            },
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle: grayTextStyle.copyWith(fontSize: 14, fontWeight: regular),
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
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              suffixIcon: Icon(Icons.calendar_today_outlined, color: textColor),
            ),
          ),
        ),
      );
    }

    Widget buildTextFormField({
      required String labelText,
      required String hintText,
      required TextEditingController controller,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
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

    Widget tanggalEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildDateFormField(
                labelText: "Tanggal Mulai Event",
                hintText: "Pilih tanggal",
                controller: _tanggalMulaiController,
                context: context,
                onDateSelected: (date) {
                  setState(() {
                    _tanggalMulai = date;
                    _tanggalMulaiController.text = "${date?.toLocal()}".split(' ')[0];
                  });
                  print("Selected date for Tanggal Mulai Event: $date");
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildDateFormField(
                labelText: "Tanggal Akhir Event",
                hintText: "Pilih tanggal",
                controller: _tanggalAkhirController,
                context: context,
                onDateSelected: (date) {
                  setState(() {
                    _tanggalAkhir = date;
                    _tanggalAkhirController.text = "${date?.toLocal()}".split(' ')[0];
                  });
                  print("Selected date for Tanggal Akhir Event: $date");
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget venueEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Venue Event',
          hintText: 'Venue Event',
          controller: _venueController,
        ),
      );
    }

    Widget provinceInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Provinsi',
            labelStyle: grayTextStyle.copyWith(fontSize: 16),
            border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            // prefixIcon dihapus
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
              selectedCity = null;
              cities = [];
            });
            if (newValue != null) {
              _loadCities(newValue);
            }
          },
        ),
      );
    }

    Widget cityInput() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Kota/Kabupaten',
            labelStyle: grayTextStyle.copyWith(fontSize: 16),
            border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            // prefixIcon dihapus
          ),
          value: selectedCity,
          items: cities.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city, style: grayTextStyle.copyWith(fontSize: 12)),
            );
          }).toList(),
          onChanged: cities.isNotEmpty
              ? (String? newValue) {
            setState(() {
              selectedCity = newValue;
            });
          }
              : null,
        ),
      );
    }

    Widget alamatEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Alamat Event',
          hintText: 'Masukkan Alamat Event',
          controller: _alamatController,
        ),
      );
    }

    return ListView(
      children: [
        tanggalEvent(),
        venueEvent(),
        provinceInput(),
        cityInput(),
        alamatEvent(),
      ],
    );
  }
}
