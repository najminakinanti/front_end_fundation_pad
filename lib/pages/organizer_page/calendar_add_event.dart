import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class CalendarAddEvent extends StatefulWidget {
  @override
  _CalendarAddEventState createState() => _CalendarAddEventState();
}

class _CalendarAddEventState extends State<CalendarAddEvent> {
  String selectedProvince = 'DKI Jakarta';
  String selectedCity = 'Jakpus';

  void onProvinceChanged(String? newProvince) {
    setState(() {
      selectedProvince = newProvince!;
    });
  }

  void onCityChanged(String? newCity) {
    setState(() {
      selectedCity = newCity!;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget buildDateFormField({
      required String labelText,
      required String hintText,
      required BuildContext context,
      required Function(DateTime?) onDateSelected,
    }) {
      TextEditingController controller = TextEditingController();
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
                context: context,
                onDateSelected: (date) {
                  print("Selected date for Tanggal Mulai Event: \$date");
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildDateFormField(
                labelText: "Tanggal Akhir Event",
                hintText: "Pilih tanggal",
                context: context,
                onDateSelected: (date) {
                  print("Selected date for Tanggal Akhir Event: \$date");
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
        ),
      );
    }

    Widget selectProvince({
      required String? selectedProvince,
      required ValueChanged<String?> onProvinceChanged,
    }) {
      List<String> provinces = ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah'];

      return buildDropdownTextFormField(
        labelText: 'Provinsi',
        hintText: 'Pilih Provinsi',
        dropdownItems: provinces,
        selectedValue: selectedProvince,
        onChanged: onProvinceChanged,
      );
    }

    Widget selectCity({
      required String? selectedCity,
      required ValueChanged<String?> onCityChanged,
    }) {
      List<String> cities = ['Jakpus', 'Jaksel', 'Jakut'];

      return buildDropdownTextFormField(
        labelText: 'Kota',
        hintText: 'Pilih Kota',
        dropdownItems: cities,
        selectedValue: selectedCity,
        onChanged: onCityChanged,
      );
    }

    Widget alamatEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Alamat Event',
          hintText: 'Masukkan Alamat Event',
        ),
      );
    }

    return ListView(
      children: [
        tanggalEvent(),
        venueEvent(),
        selectProvince(selectedProvince: null, onProvinceChanged: onProvinceChanged),
        selectCity(selectedCity: null, onCityChanged: onCityChanged),
        alamatEvent(),
      ],
    );
  }
}
