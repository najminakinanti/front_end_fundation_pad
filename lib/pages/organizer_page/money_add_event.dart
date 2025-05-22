import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pad_fundation/theme.dart';


class MoneyAddEvent extends StatefulWidget {
  MoneyAddEvent({Key? key}) : super(key: key);

  @override
  MoneyAddEventState createState() => MoneyAddEventState();
}

class MoneyAddEventState extends State<MoneyAddEvent> {
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();


  DateTime? _selectedTanggal;

  Future<void> saveTargetToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('target_donasi_sponsor', _targetController.text);
    if (_selectedTanggal != null) {
      await prefs.setString('sponsor_deadline', _selectedTanggal.toString());
    }

    print("✅ Data berhasil disimpan:");
    print("Target Donasi: ${_targetController.text}");
    print("Tenggat Donasi: ${prefs.getString('sponsor_deadline')}");
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
                setState(() {
                  _selectedTanggal = pickedDate;
                  _tanggalController.text = "${pickedDate.toLocal()}".split(' ')[0];
                });
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

    Widget targetDonasi() {
      return buildTextFormField(
          labelText: 'Target Donasi Sponsor',
          hintText: 'Masukkan target dana',
        controller: _targetController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      );
    }

    Widget tenggatDonasi() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildDateFormField(
          labelText: "Tenggat Donasi Sponsor",
          hintText: "Pilih tanggal",
          controller: _tanggalController,
          context: context,
          onDateSelected: (date) {
            setState(() {
              _selectedTanggal = date;
              _tanggalController.text = "${date?.toLocal()}".split(' ')[0];
            });
            print("Selected date for Tanggal Mulai Event: $date");
          },
        ),
      );
    }

    return ListView(
      children: [
        targetDonasi(),
        tenggatDonasi(),
      ],
    );
  }
}
