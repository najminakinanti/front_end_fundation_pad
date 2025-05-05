import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/models/event.dart'; // Sesuaikan import model kamu
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

import '../../models/sponsor.dart';
import '../../pages/mitra_page/detail_event_mitra.dart';

class EventCardMitra extends StatefulWidget {
  final Event event;
  final VoidCallback? onTap;

  const EventCardMitra({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);

  @override
  _EventCardMitraState createState() => _EventCardMitraState();
}

class _EventCardMitraState extends State<EventCardMitra> {
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
      // onTap: widget.onTap ?? () => Navigator.pushNamed(context, '/detail-event-mitra'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailEventMitra(event: event),
          ),
        );
      },
      child: Container(
        width: 225,
        height: 225,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    event.eventPhotos.isNotEmpty
                        ? event.eventPhotos.first.photoFile
                        : 'https://via.placeholder.com/150',
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Jika ada error dalam memuat gambar, tampilkan gambar profil diri
                      return Image.asset(
                        'assets/img_kochella.png', // Ganti dengan path gambar profil diri di assets
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: sageGreen3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event.statusEvent.toUpperCase(),
                      style: orangeTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                // Bookmark Icon
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isBookmarked = !isBookmarked;
                      });
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: backgroundColor3,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          isBookmarked
                              ? 'assets/icon_bookmark_on.png'
                              : 'assets/icon_bookmark_off.png',
                          width: 15,
                          height: 15,
                        ),
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
                  Text(
                    event.title,
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Terkumpul ${getTotalAmount(event.sponsors)}', // Menampilkan total terkumpul dengan format Rp
                    style: lighGrayTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: regular,
                    ),
                  ),
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
                      const SizedBox(width: 5),
                      Text(
                        '${getProgress(event).toStringAsFixed(2)}%', // Menampilkan persentase progres
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(8),
                  //         child: LinearProgressIndicator(
                  //           value: event.eventFund != null
                  //               ? (event.eventFund!.targetFund > 0
                  //               ? event.eventFund!.targetFund / 100.0
                  //               : 0)
                  //               : 0,
                  //           backgroundColor: lineColor2,
                  //           valueColor: AlwaysStoppedAnimation<Color>(
                  //             lineColor,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 5),
                  //     Text(
                  //       '${((event.eventFund?.targetFund ?? 0) * 100).toInt()}%',
                  //       style: blackTextStyle.copyWith(
                  //         fontSize: 10,
                  //         fontWeight: regular,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 7),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Menentukan arah scroll horizontal
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Ubah ke start agar elemen di sebelah kiri
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icon_donorship.png', width: 18),
                            const SizedBox(width: 4),
                            Text(
                              '${getTotalSponsors(event.sponsors)} Sponsors', // Menampilkan jumlah sponsor
                              style: veryLightGrayTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: regular,
                              ),
                            )

                          ],
                        ),
                        const SizedBox(width: 10), // Menambahkan jarak minimal 10 antara elemen
                        Row(
                          children: [
                            Image.asset('assets/icon_timer.png', width: 13),
                            const SizedBox(width: 4),
                            Text(
                              '${getDaysRemaining(event.eventPlacement?.eventStartDate ?? '2025-06-10')} hari lagi',
                              style: veryLightGrayTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),

                  const SizedBox(height: 7),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 5,
                      children: event.categories
                          .map(
                            (category) => CategoryButton(
                          label: category.name, // Menggunakan category.name
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

