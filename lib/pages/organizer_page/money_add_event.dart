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

  // String? namaEvent;
  // String? statusEvent;
  // List<String>? kategoriEvent;
  // String? jumlahTarget;
  // String? kategoriPartisipan;
  // String? deskripsiEvent;
  // String? venue;
  // String? alamat;
  // String? provinsiEvent;
  // String? kotaEvent;
  // String? tanggalMulai;
  // String? tanggalAkhir;

  // @override
  // void initState() {
  //   super.initState();
  //   loadEventData();
  // }

  // Future<void> loadEventData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     namaEvent = prefs.getString('nama_event');
  //     statusEvent = prefs.getString('status_event');
  //     kategoriEvent = prefs.getStringList('kategori_event');
  //     jumlahTarget = prefs.getString('jumlah_target');
  //     kategoriPartisipan = prefs.getString('kategori_partisipan');
  //     deskripsiEvent = prefs.getString('deskripsi_event');
  //
  //     venue = prefs.getString('venue_event');
  //     alamat = prefs.getString('alamat_event');
  //     provinsiEvent = prefs.getString('provinsi_event');
  //     kotaEvent = prefs.getString('kota_event');
  //     tanggalMulai = prefs.getString('tanggal_mulai');
  //     tanggalAkhir = prefs.getString('tanggal_akhir');
  //   });
  //
  //   // ✅ Print semua ke terminal
  //   print("=== Data Event Utama ===");
  //   print("Nama Event: $namaEvent");
  //   print("Status: $statusEvent");
  //   print("Kategori: $kategoriEvent");
  //   print("Jumlah Target: $jumlahTarget");
  //   print("Kategori Partisipan: $kategoriPartisipan");
  //   print("Deskripsi: $deskripsiEvent");
  //
  //   print("=== Data Kalender ===");
  //   print("Venue: $venue");
  //   print("Alamat: $alamat");
  //   print("Provinsi: $provinsiEvent");
  //   print("Kota: $kotaEvent");
  //   print("Tanggal Mulai: $tanggalMulai");
  //   print("Tanggal Akhir: $tanggalAkhir");
  // }

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
