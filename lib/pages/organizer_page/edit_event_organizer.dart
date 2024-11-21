import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class EditEventOrganizer extends StatefulWidget {
  @override
  _EditEventOrganizerState createState() => _EditEventOrganizerState();
}

class _EditEventOrganizerState extends State<EditEventOrganizer> {

  String selectedEvent = 'apa';
  String selectedStatus = 'aktif';
  String selectedCategory = 'kategorinya';
  String selectedParticipant = 'bokap bokap';
  String selectedProvince = 'DKI Jakarta';
  String selectedCity = 'Jakpus';

  void onEventChanged(String? newEvent) {
    setState(() {
      selectedEvent = newEvent!;
    });
  }

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

  void onParticipantChanged(String? newParticipant) {
    setState(() {
      selectedParticipant = newParticipant!;
    });
  }

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

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icon_panah_kiri.png',
                        width: 8,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Ubah Event',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildTextFormField({
      required String labelText,
      required String initialValue,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: TextEditingController(text: initialValue),
            style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular
            ),
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
      required String initialValue,
      required List<String> dropdownItems,
      required String? selectedValue,
      required ValueChanged<String?> onChanged,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SizedBox(
          height: 48,
          child: DropdownButtonFormField<String>(
            value: selectedValue ?? initialValue,
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
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular
            ),
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget buildDateFormField({
      required String labelText,
      required String initialValue,
      required BuildContext context,
      required Function(DateTime?) onDateSelected,
    }) {
      TextEditingController controller = TextEditingController(text: initialValue);

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

    Widget buildListTile({
      required String labelText,
      required String title,
      required BuildContext context, // Add context to pass to Navigator
      required VoidCallback onTap,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: grayTextStyle.copyWith(fontSize: 14),
                ),
                trailing: Image.asset('assets/icon_panah_kanan_hitam.png'),
                onTap: () {
                  Navigator.pushNamed(context, '/ubah-kontraprestasi');
                },
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
            Positioned(
              left: 10,
              top: -8,
              child: Container(
                color: backgroundColor3,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  labelText,
                  style: grayTextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }




    Widget namaEvent() {
      return buildTextFormField(
          labelText: 'Nama Event',
          initialValue: 'Mufest'
      );
    }

    Widget jenisEvent({
      required String selectedEvent,
      required ValueChanged<String?> onEventChanged,
    }) {
      List<String> events = ['apa', 'nih', 'jenisnya'];

      return buildDropdownTextFormField(
        labelText: 'Jenis Event',
        initialValue: events[0],  // Default value
        dropdownItems: events,
        selectedValue: selectedEvent,
        onChanged: onEventChanged,
      );
    }

    Widget statusEvent({
      required String selectedStatus,
      required ValueChanged<String?> onStatusChanged,
    }) {
      List<String> statuses = ['aktif', 'yakali', 'gak'];

      return buildDropdownTextFormField(
        labelText: 'Status Event',
        initialValue: statuses[0],
        dropdownItems: statuses,
        selectedValue: selectedStatus,
        onChanged: onStatusChanged,
      );
    }

    Widget kategoriEvent({
      required String selectedCategory,
      required ValueChanged<String?> onCategoryChanged,
    }) {
      List<String> categories = ['kategorinya', 'ada', 'apa', 'aja'];

      return buildDropdownTextFormField(
        labelText: 'Kategori Event',
        initialValue: categories[0],
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
          initialValue: '100000',
        ),
      );
    }

    Widget kategoriPartisipan({
      required String selectedParticipant,
      required ValueChanged<String?> onParticipantChanged,
    }) {
      List<String> participant = ['bokap bokap', 'abang abang', 'nenek nenek'];

      return buildDropdownTextFormField(
        labelText: 'Kategori Partisipan',
        initialValue: participant[0],
        dropdownItems: participant,
        selectedValue: selectedParticipant,
        onChanged: onParticipantChanged,
      );
    }

    Widget detailParticipant() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Detail Partisipan',
          initialValue: 'detail partisipan tu masudnya apa deh blm kepikir',
        ),
      );
    }

    Widget deskripsiEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Deskripsi Event',
          initialValue: 'ini belum, gimana ya bikin kotaknya jadi lebar',
        ),
      );
    }

    Widget pictureInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextFormField(
                readOnly: true,
                initialValue: 'WhatsApp Image 2024-11-08',
                decoration: InputDecoration(
                  labelText: 'Gambar Organizer',
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
                      print('unggah foto yh maniz');
                    },
                    child: Container(
                      width: 80,
                      height: 55,
                      decoration: BoxDecoration(
                        color: sageGreen2,
                        border: Border(
                          right: BorderSide(color: primaryColor),
                          top: BorderSide(color: primaryColor),
                          bottom: BorderSide(color: primaryColor),
                          left: BorderSide.none,
                        ),
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

    Widget tanggalEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildDateFormField(
                labelText: "Tanggal Mulai Event",
                initialValue: "2024-09-19",
                context: context,
                onDateSelected: (date) {
                  print("Selected date for Tanggal Mulai Event: $date");
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildDateFormField(
                labelText: "Tanggal Akhir Event",
                initialValue: "2024-09-20",
                context: context,
                onDateSelected: (date) {
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
          initialValue: 'dtedi anjay',
        ),
      );
    }

    Widget selectProvince({
      required String selectedProvince,
      required ValueChanged<String?> onProvinceChanged,
    }) {
      List<String> provinces = ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah'];

      return buildDropdownTextFormField(
        labelText: 'Provinsi',
        initialValue: provinces[0],
        dropdownItems: provinces,
        selectedValue: selectedProvince,
        onChanged: onProvinceChanged,
      );
    }

    Widget selectCity({
      required String selectedCity,
      required ValueChanged<String?> onCityChanged,
    }) {
      List<String> cities = ['Jakpus', 'Jaksel', 'Jakut'];

      return buildDropdownTextFormField(
        labelText: 'Kota',
        initialValue: cities[0],
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
          initialValue: 'rekomen dong dimana',
        ),
      );
    }

    Widget targetDonasi() {
      return buildTextFormField(
          labelText: 'Target Donasi Sponsor',
          initialValue: 'yang banyak'
      );
    }

    Widget tenggatDonasi() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildDateFormField(
          labelText: "Tenggat Donasi Sponsor",
          initialValue: "2024-08-19",
          context: context,
          onDateSelected: (date) {
            print("Selected date for Tanggal Mulai Event: $date");
          },
        ),
      );
    }

    Widget kontraprestasi1() {
      return Container(
        child: buildListTile(
          labelText: 'Kontraprestasi 1',
          title: 'Emas',
          context: context,
          onTap: () {

          },
        ),
      );
    }

    Widget kontraprestasi2() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildListTile(
          labelText: 'Kontraprestasi 2',
          title: 'Perak',
          context: context,
          onTap: () {

          },
        ),
      );
    }

    Widget kontraprestasi3() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildListTile(
          labelText: 'Kontraprestasi 3',
          title: 'Perunggu',
          context: context,
          onTap: () {

          },
        ),
      );
    }

    Widget addKontraprestasiButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 0, top: 30),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            print('tambah kontraprestasi');
            Navigator.pushNamed(context, '/add-kontraprestasi');
          },
          style: TextButton.styleFrom(
            backgroundColor: creamButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: primaryColor, width: 1),
            ),
          ),
          child: Text(
            'Tambah Kontraprestasi',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget saveButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            showConfirmationDialog(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'SIMPAN PERUBAHAN',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget _buildDataEventSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                namaEvent(),
                jenisEvent(selectedEvent: selectedEvent, onEventChanged: onEventChanged),
                statusEvent(selectedStatus: selectedStatus, onStatusChanged: onStatusChanged),
                kategoriEvent(selectedCategory: selectedCategory, onCategoryChanged: onCategoryChanged),
                jumlahTarget(),
                kategoriPartisipan(selectedParticipant: selectedParticipant, onParticipantChanged: onParticipantChanged),
                detailParticipant(),
                deskripsiEvent(),
                pictureInput(),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Event',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDataWaktuTempatSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                tanggalEvent(),
                venueEvent(),
                selectProvince(selectedProvince: selectedProvince, onProvinceChanged: onProvinceChanged),
                selectCity(selectedCity: selectedCity, onCityChanged: onCityChanged),
                alamatEvent(),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Tempat dan Waktu',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDataInfoDanaSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                targetDonasi(),
                tenggatDonasi(),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Informasi Dana',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDataKontraprestasiSection() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                kontraprestasi1(),
                kontraprestasi2(),
                kontraprestasi3(),
                addKontraprestasiButton(),
              ],
            ),

          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Data Kontraprestasi',
                style: lighGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          _buildDataEventSection(),
          SizedBox(height: 15),
          _buildDataWaktuTempatSection(),
          SizedBox(height: 15),
          _buildDataInfoDanaSection(),
          SizedBox(height: 15),
          _buildDataKontraprestasiSection(),
          SizedBox(height: 15),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
      bottomNavigationBar: saveButton(),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 250,
            child: Text(
              'Perubahan event berhasil disimpan!',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(30, 40, 15, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail-my-event-organizer');
              },
              child: Text(
                'OK',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
          ],
        );
      },
    );
  }
}
