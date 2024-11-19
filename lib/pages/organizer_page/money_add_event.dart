import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class MoneyAddEvent extends StatelessWidget {

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

    Widget targetDonasi() {
      return buildTextFormField(
          labelText: 'Target Donasi Sponsor',
          hintText: 'Masukkan target dana'
      );
    }

    Widget tenggatDonasi() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildDateFormField(
          labelText: "Tenggat Donasi Sponsor",
          hintText: "Pilih Tanggal",
          context: context,
          onDateSelected: (date) {
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
