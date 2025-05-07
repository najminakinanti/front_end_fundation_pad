import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

import '../../API/event_api.dart';
import '../../models/event.dart';
import '../../models/sponsor.dart';
import '../../pages/mitra_page/detail_event_mitra.dart';

class EventCardBigMitra extends StatefulWidget {
  final Event event;
  final VoidCallback? onTap;

  const EventCardBigMitra({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);

  @override
  _EventCardBigMitraState createState() => _EventCardBigMitraState();
}

class _EventCardBigMitraState extends State<EventCardBigMitra> {
  bool isBookmarked = false;

  String getTotalAmount(List<Sponsor> sponsors) {
    // Menjumlahkan total amount dengan tipe int
    final totalAmount = sponsors.fold<int>(0, (total, sponsor) => total + sponsor.amount.toInt());

    // Format angka ke format mata uang Indonesia (Rp)
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return formatCurrency.format(totalAmount); // Mengembalikan dalam format "Rp X.XXX.XXX"
  }

  int getTotalSponsors(List<Sponsor> sponsors) {
    return sponsors.length; // Menghitung jumlah sponsor
  }

  int getDaysRemaining(String eventStartDate) {
    // Parse tanggal mulai acara dari string ke DateTime
    DateTime startDate = DateTime.parse(eventStartDate);

    // Mendapatkan tanggal hari ini
    DateTime currentDate = DateTime.now();

    // Menghitung selisih hari
    Duration difference = startDate.difference(currentDate);

    // Mengembalikan jumlah hari yang tersisa
    return difference.inDays;
  }

  // Fungsi untuk menghitung progres
  double getProgress(Event event) {
    // Mendapatkan total amount dari sponsor dan mengonversinya ke int
    String totalAmountStr = getTotalAmount(event.sponsors).replaceAll('Rp', '').replaceAll('.', '').trim();
    double totalAmount = double.parse(totalAmountStr); // Mengubah ke double untuk perhitungan

    // Mendapatkan target fund dari event fund
    double targetFund = (event.eventFund?.targetFund ?? 0).toDouble();

    // Menghindari pembagian dengan 0 jika target fund = 0
    if (targetFund == 0) {
      return 0; // Atau 100, tergantung logika yang diinginkan
    }

    // Menghitung progres (persentase) berdasarkan total amount dan target fund
    return (totalAmount / targetFund) * 100;
  }


  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return GestureDetector(
      onTap: () async {
        await EventApi.incrementClick(event.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailEventMitra(event: event),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    event.eventPhotos.isNotEmpty
                        ? event.eventPhotos.first.photoFile
                        : 'https://via.placeholder.com/150',
                    width: double.infinity,
                    height: 230,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Jika ada error dalam memuat gambar, tampilkan gambar profil diri
                      return Image.asset(
                        'assets/img_kochella.png', // Ganti dengan path gambar profil diri di assets
                        width: double.infinity,
                        height: 230,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: sageGreen3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event.statusEvent.toUpperCase(),
                      style: orangeTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        event.title,
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/icon_calendar.png', width: 11),
                      SizedBox(width: 4),
                      Text(
                        event.eventPlacement?.eventStartDate != null
                            ? DateFormat('dd MMM yyyy').format(DateTime.parse(event.eventPlacement!.eventStartDate))
                            : '-',
                        style: lighGrayTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Terkumpul ${getTotalAmount(event.sponsors)}',
                    style: lighGrayTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: event.eventFund != null
                                ? (getProgress(event) / 100) // Menghitung nilai progres dalam bentuk 0.0 hingga 1.0
                                : 0,
                            backgroundColor: lineColor2,
                            valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${getProgress(event).toStringAsFixed(2)}%',
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icon_donorship.png', width: 18),
                          SizedBox(width: 4),
                          Text(
                            '${event.sponsors.length} Donorship',
                            style: veryLightGrayTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Image.asset('assets/icon_timer.png', width: 13),
                          SizedBox(width: 4),
                          Text(
                            '${getDaysRemaining(event.eventPlacement?.eventStartDate ?? '2025-06-10')} hari lagi',
                            style: veryLightGrayTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 5,
                      children: event.categories
                          .map(
                            (category) => CategoryButton(
                          label: category.name,
                          onTap: () {
                            print(category.name);
                          },
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
