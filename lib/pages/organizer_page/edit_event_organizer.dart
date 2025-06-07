import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pad_fundation/API/event_api.dart';
import 'package:pad_fundation/pages/organizer_page/edit_kontraprestasi.dart';
import 'package:pad_fundation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/location_api.dart';
import '../../models/event.dart';
import '../../models/kontraprestasi.dart';

class EditEventOrganizer extends StatefulWidget {

  final Event event;
  final VoidCallback? onTap;

  const EditEventOrganizer({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);


  @override
  _EditEventOrganizerState createState() => _EditEventOrganizerState();
}

class _EditEventOrganizerState extends State<EditEventOrganizer> {

  late TextEditingController _namaEventController;
  late TextEditingController _jumlahTargetController;
  late TextEditingController _detailParticipantController;
  late TextEditingController _deskripsiEventController;
  late TextEditingController _venueEventController;
  late TextEditingController _alamatEventController;
  late TextEditingController _targetDonasiController;
  late TextEditingController _imageController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _tenggatDonasiController;
  late TextEditingController _categoryController;

  String? selectedProvince;
  String? selectedCity;
  List<String> provinces = [];
  List<String> cities = [];

  late String _selectedStatus;
  List<String> selectedCategories = [];
  List<Kontraprestasi> kontraprestasiList = [];
  String? photo_file;
  String selectedEvent = 'apa';
  String selectedCategory = 'kategorinya';
  String selectedParticipant = 'bokap bokap';

  final Map<String, int> iconNameToId = {
    'Platinum': 1,
    'Diamond': 2,
    'Gold': 3,
    'Silver': 4,
    'Bronze': 5,
  };

  final List<Map<String, dynamic>> categoryOptions = [
    {'id': '1', 'name': 'Kuliner'},
    {'id': '2', 'name': 'Festival'},
    {'id': '3', 'name': 'Pendidikan'},
    {'id': '4', 'name': 'Seniman'},
  ];

  void onEventChanged(String? newEvent) {
    setState(() {
      selectedEvent = newEvent!;
    });
  }

  void onStatusChanged(String? newStatus) {
    setState(() {
      _selectedStatus = newStatus!;
    });
  }

  void onParticipantChanged(String? newParticipant) {
    setState(() {
      selectedParticipant = newParticipant!;
    });
  }

  void onProvinceChanged(String? newValue) {
    setState(() {
      selectedProvince = newValue;
      selectedCity = null;
      cities = [];
    });

    if (newValue != null) {
      _loadCities(newValue);
    }
  }

  void onCityChanged(String? newValue) {
    setState(() {
      selectedCity = newValue;
    });
  }

  void _loadProvinces() async {
    try {
      final data = await LocationApi.fetchProvinces();
      setState(() {
        provinces = data.map((item) => item['province'].toString()).toList();
      });
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
    } catch (e) {
      print('Gagal memuat kota: $e');
    }
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

  Future<void> loadKontraprestasiFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? kontraprestasiJson = prefs.getString('kontraprestasi_list');

    if (kontraprestasiJson != null) {
      List<dynamic> list = jsonDecode(kontraprestasiJson);
      kontraprestasiList = list.map((e) => Kontraprestasi.fromJson(e)).toList();
      setState(() {});
    }
  }

  final Map<String, int> iconNameToIdLowerCase = {
    'platinum': 1,
    'diamond': 2,
    'gold': 3,
    'silver': 4,
    'bronze': 5,
  };


  @override
    void initState() {
      super.initState();
      _loadProvinces();
      selectedProvince = widget.event.eventPlacement?.province;
      selectedCity = widget.event.eventPlacement?.city;
      if (selectedProvince != null) {
        _loadCities(selectedProvince!);
      }
      _namaEventController = TextEditingController(text: widget.event.title);
      _jumlahTargetController = TextEditingController(text: widget.event.targetParticipant.toString());
      _detailParticipantController = TextEditingController(text: widget.event.participantName);
      _deskripsiEventController = TextEditingController(text: widget.event.description);
      _venueEventController = TextEditingController(text: widget.event.eventPlacement?.eventVenue ?? '');
      _alamatEventController = TextEditingController(text: widget.event.eventPlacement?.address ?? '');
      _targetDonasiController = TextEditingController(text: widget.event.eventFund?. targetFund.toString() ?? '');

      final String? initialImageName = widget.event.eventPhotos.isNotEmpty ? widget.event.eventPhotos[0].photoFile : null;
      _imageController = TextEditingController(text: initialImageName ?? '');

      _startDateController = TextEditingController(text: widget.event.eventPlacement?.eventStartDate ?? ''); // pastikan sesuai nama field model);
      _endDateController = TextEditingController(text: widget.event.eventPlacement?.eventEndDate ?? '');
      _tenggatDonasiController = TextEditingController(text: widget.event.eventFund?.sponsorDeadline ?? '');

      _categoryController = TextEditingController(
        text: widget.event.categories.map((c) => c.name).join(', '),
      );
      kontraprestasiList = (widget.event.kontraprestasis ?? []).map((k) {
        // misal kamu tambahkan properti baru ini secara manual di model:
        int iconId = iconNameToIdLowerCase[(k.title ?? '').trim().toLowerCase()] ?? 1;

        return Kontraprestasi(
          id: k.id,
          title: k.title,
          minSponsor: k.minSponsor,
          maxSponsor: k.maxSponsor,
          feedback: k.feedback,
          iconPhotoKontraprestasisId: iconId,
        );
      }).toList();

      _selectedStatus = widget.event.typeEvent;
      selectedProvince = widget.event.eventPlacement?.province ?? '';
      selectedCity = widget.event.eventPlacement?.city ?? '';
    }

  @override
  void dispose() {
    _namaEventController.dispose();
    _jumlahTargetController.dispose();
    _detailParticipantController.dispose();
    _deskripsiEventController.dispose();
    _venueEventController.dispose();
    _alamatEventController.dispose();
    _targetDonasiController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _tenggatDonasiController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final placement = event.eventPlacement;

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

    // Widget buildTextFormField({
    //   required String labelText,
    //   required String initialValue,
    // }) {
    //   return Container(
    //     margin: EdgeInsets.only(top: 10),
    //     child: SizedBox(
    //       height: 48,
    //       child: TextFormField(
    //         controller: TextEditingController(text: initialValue),
    //         style: blackTextStyle.copyWith(
    //             fontSize: 14,
    //             fontWeight: regular
    //         ),
    //         decoration: InputDecoration(
    //           labelText: labelText,
    //           labelStyle: grayTextStyle.copyWith(fontSize: 14),
    //           border: OutlineInputBorder(
    //             borderSide: BorderSide(color: primaryColor),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: primaryColor),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: primaryColor),
    //           ),
    //           floatingLabelBehavior: FloatingLabelBehavior.always,
    //           contentPadding: EdgeInsets.symmetric(
    //             vertical: 12, horizontal: 12,
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }
    Widget buildTextFormField({
      required String labelText,
      required TextEditingController controller,
    }) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: grayTextStyle.copyWith(fontSize: 14),
              border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
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
      required TextEditingController controller,
      required BuildContext context,
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

    Widget buildReadOnlyField({
      required String labelText,
      required String value,
      required VoidCallback onTap,
    }) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        child: InkWell(
          onTap: onTap,
          child: IgnorePointer(
            child: TextFormField(
              initialValue: value,
              readOnly: true,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
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
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey, // sesuaikan dengan tema
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget namaEvent() {
      return buildTextFormField(
        labelText: 'Nama Event',
        controller: _namaEventController,
      );
    }

    Widget statusEvent({
      required String selectedStatus,
      required ValueChanged<String?> onStatusChanged,
    }) {
      List<String> statuses = ['ONLINE', 'OFFLINE'];

      return buildDropdownTextFormField(
        labelText: 'Status Event',
        initialValue: statuses[0],
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
          controller: _jumlahTargetController,
        ),
      );
    }

    Widget kategoriPartisipan() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'kategoriPartisipan',
          controller: _detailParticipantController,
        ),
      );
    }

    Widget deskripsiEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Deskripsi Event',
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
              height: 60,
              child: TextFormField(
                controller: _imageController,
                readOnly: true,
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
                      _pickImageBase64();
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
                controller: _startDateController,
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
                controller: _endDateController,
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
          controller: _venueEventController,
        ),
      );
    }

    Widget selectProvince({
      required String? selectedProvince,
      required ValueChanged<String?> onProvinceChanged,
    }) {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Provinsi',
          border: OutlineInputBorder(),
        ),
        value: selectedProvince,
        style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        items: provinces.map((province) {
          return DropdownMenuItem<String>(
            value: province,
            child: Text(province,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),),
          );
        }).toList(),
        onChanged: (value) {
          onProvinceChanged(value);
          _loadCities(value!);
        },
      );
    }

    Widget selectCity({
      required String? selectedCity,
      required ValueChanged<String?> onCityChanged,
    }) {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Kota/Kabupaten',
          border: OutlineInputBorder(),
        ),
        value: selectedCity,
        style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        items: cities.map((city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),),
          );
        }).toList(),
        onChanged: cities.isNotEmpty ? onCityChanged : null,
      );
    }

    Widget alamatEvent() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildTextFormField(
          labelText: 'Alamat Event',
          controller: _alamatEventController,
        ),
      );
    }

    Widget targetDonasi() {
      return buildTextFormField(
          labelText: 'Target Donasi Sponsor',
          controller: _targetDonasiController,
      );
    }

    Widget tenggatDonasi() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: buildDateFormField(
          labelText: "Tenggat Donasi Sponsor",
          controller: _tenggatDonasiController,
          context: context,
          onDateSelected: (date) {
            print("Selected date for Tanggal Mulai Event: $date");
          },
        ),
      );
    }

    Widget addKontraprestasiButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 0, top: 15),
        width: double.infinity,
        child: TextButton(
          onPressed: () async {
            print('tambah kontraprestasi');
            // await Navigator.pushNamed(context, '/add-kontraprestasi');
            // await loadKontraprestasiFromPrefs();
            final result = await Navigator.pushNamed(context, '/add-kontraprestasi');
            if (result == 'refresh') {
              // Panggil fungsi reload data, misal:
              loadKontraprestasiFromPrefs();
            }
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
          onPressed: () async {
            final updatedData = {
              'event': {
                'title': _namaEventController.text,
                'type_event': _selectedStatus,
                'target_participant': int.tryParse(_jumlahTargetController.text) ?? 0,
                'participant_name': _detailParticipantController.text,
                'description': _deskripsiEventController.text,
              },
              'event_photos': [
                {'photo_file': _imageController.text},
              ],
              'event_categories': event.categories.map((cat) {
                return {
                  "event_category_names_id": cat.id,
                };
              }).toList(),
              'event_placement': {
                'event_start_date': _startDateController.text,
                'event_end_date': _endDateController.text,
                'event_venue': _venueEventController.text,
                'address': _alamatEventController.text,
                'city': selectedCity,
                'province': selectedProvince,
              },
              'event_fund': {
                'target_fund': _targetDonasiController.text,
                'sponsor_deadline': _tenggatDonasiController.text,
              },
            };

            try {
              await EventApi.editEvent(context, event.id, updatedData);

              final kontraprestasiPayload = {
                "kontraprestasis": kontraprestasiList.map((item) {
                  final map = {
                    "title": item.title,
                    "min_sponsor": item.minSponsor,
                    "max_sponsor": item.maxSponsor,
                    "icon_photo_kontraprestasis_id": item.iconPhotoKontraprestasisId,
                    "feedback": item.feedback ?? '',
                  };
                  if (item.id != null) {
                    map["id"] = item.id;
                  }
                  return map;
                }).toList(),
              };

              await EventApi.upsertKontraprestasi(event.id, kontraprestasiPayload);

              // Kamu bisa juga show success dialog di sini jika mau
              print("Semua data berhasil disimpan.");

            } catch (e) {
              print('Gagal menyimpan data: $e');
              // _showErrorDialog(context, 'Gagal menyimpan data: $e');
            }
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
                statusEvent(selectedStatus: _selectedStatus, onStatusChanged: onStatusChanged),
                kategoriEventMulti(),
                jumlahTarget(),
                kategoriPartisipan(),
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
                SizedBox(height: 25),
                selectProvince(selectedProvince: selectedProvince, onProvinceChanged: onProvinceChanged),
                SizedBox(height: 25),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...kontraprestasiList.asMap().entries.map((e) {
                  final kontraprestasi = e.value;
                  return buildReadOnlyField(
                    labelText: 'Kontraprestasi ${e.key + 1}',
                    value: kontraprestasi.title ?? '',
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditKontraprestasi(
                            kontraprestasi: kontraprestasi,
                          ),
                        ),
                      );
                      if (result == 'refresh') {
                        await loadKontraprestasiFromPrefs();
                      }
                    },
                  );
                }).toList(),
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
