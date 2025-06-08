import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/API/api_service.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

import '../../API/event_api.dart';
import '../../models/event.dart';
import '../../models/kontraprestasi_evidences.dart';
import '../../models/sponsor.dart';
import '../../pages/mitra_page/detail_event_mitra.dart';

class SponsorTileMitra extends StatefulWidget {
  final Event event;
  final Sponsor sponsor;
  final List<KontraprestasiEvidence> evidences;
  final VoidCallback? onTap;

  const SponsorTileMitra({
    Key? key,
    required this.event,
    required this.sponsor,
    required this.evidences,
    this.onTap,
  }) : super(key: key);

  @override
  _SponsorTileMitraState createState() => _SponsorTileMitraState();
}

class _SponsorTileMitraState extends State<SponsorTileMitra> {

  double getSponsorAmountByUser(Event event, int userId) {
    final filteredSponsors = event.sponsors.where((sponsor) => sponsor.entrepreneurId == userId).toList();
    print('Filtered sponsors for userId $userId: $filteredSponsors');
    final amount = filteredSponsors.fold(0.0, (sum, sponsor) => sum + sponsor.amount);
    print('Total sponsor amount for userId $userId: $amount');
    return amount;
  }

  String getTotalAmount(List<Sponsor> sponsors) {
    final totalAmount = sponsors.fold<int>(0, (total, sponsor) => total + sponsor.amount.toInt());
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatCurrency.format(totalAmount);
  }

  int getTotalSponsors(List<Sponsor> sponsors) {
    return sponsors.length;
  }

  int getDaysRemaining(String eventStartDate) {
    DateTime startDate = DateTime.parse(eventStartDate);
    DateTime currentDate = DateTime.now();
    Duration difference = startDate.difference(currentDate);
    return difference.inDays;
  }

  double getProgress(Event event) {
    String totalAmountStr = getTotalAmount(event.sponsors).replaceAll('Rp', '').replaceAll('.', '').trim();
    double totalAmount = double.parse(totalAmountStr);
    double targetFund = (event.eventFund?.targetFund ?? 0).toDouble();

    if (targetFund == 0) {
      return 0;
    }

    return (totalAmount / targetFund) * 100;
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final placement = event.eventPlacement;

    final int userId = widget.sponsor.entrepreneurId;  // ambil dari data sponsor
    final double sponsorAmount = getSponsorAmountByUser(event, userId);
    final int sponsorAmountInJuta = (widget.sponsor.amount / 1000000).round();

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
        width: MediaQuery.of(context).size.width,
        height: 135,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child:
                  Image.network(
                    event.eventPhotos.isNotEmpty
                        ? event.eventPhotos.first.photoFile
                        : 'https://via.placeholder.com/150',
                    width: 127,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/img_kochella.png',
                        width: 127,
                        height: double.infinity,
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
                      event.typeEvent.toUpperCase(),
                      style: orangeTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              event.title,
                              style: grayTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Image.asset('assets/icon_calendar.png', width: 11),
                        SizedBox(width: 4),
                        Text(
                          event.eventPlacement?.eventStartDate != null
                              ? DateFormat('dd MMM yyyy').format(DateTime.parse(event.eventPlacement!.eventStartDate))
                              : '-',
                          style: veryLightGrayTextStyle.copyWith(fontSize: 10, fontWeight: bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'di ${placement?.eventVenue ?? 'TO BE ANNOUNCED'}',
                      style: lighGrayTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(height: 12),
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
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          padding:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: lightYellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icon_uang.png',
                                width: 18,
                                height: 18,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 5),
                              Text(
                                // 'x',
                                '$sponsorAmountInJuta juta',
                                style: blackTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            final imagePaths = widget.evidences.map((e) => e.photoFile).toList();
                            final descriptions = widget.evidences.map((e) => e.description ?? '').toList();

                            print('Photo files: $imagePaths');
                            print('Descriptions: $descriptions');

                            _showLargeImage(context, imagePaths, descriptions, 0);
                          },
                          child: Container(
                            height: 25,
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: lightYellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon_eye.png',
                                  width: 14,
                                  height: 14,
                                  color: textColor2,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Kontraprestasi',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLargeImage(BuildContext context, List<String> imagePaths, List<String> descriptions, int initialIndex,) {
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bukti Kontraprestasi",
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Builder(
                            builder: (context) {
                              final imageUrl = imagePaths[currentIndex].startsWith('http')
                                  ? imagePaths[currentIndex]
                                  : '${ApiService.photourl}${imagePaths[currentIndex]}';

                              print('Image URL: $imageUrl'); // ✅ Cetak URL ke debug console

                              return SizedBox(
                                width: 300,
                                height: 300,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover, // ⬅️ Tidak memotong, menjaga proporsi
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            (loadingProgress.expectedTotalBytes ?? 1)
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      alignment: Alignment.center,
                                      child: Text('Image not available'),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          descriptions[currentIndex],
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -25,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          backgroundColor: textColor3,
                          child: Image.asset(
                            'assets/icon_x.png',
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (currentIndex > 0)
                    Positioned(
                      top: 190,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex--;
                          });
                        },
                        child: Image.asset(
                          'assets/icon_button_panah_kiri.png',
                          width: 24,
                        ),
                      ),
                    ),
                  if (currentIndex < imagePaths.length - 1)
                    Positioned(
                      top: 190,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex++;
                          });
                        },
                        child: Image.asset(
                          'assets/icon_button_panah_kanan.png',
                          width: 24,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
