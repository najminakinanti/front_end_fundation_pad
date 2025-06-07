import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/models/event.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';
import 'package:pad_fundation/widgets/information_detail_galery.dart';
import 'package:pad_fundation/widgets/kontraprestasi_category.dart';
import 'package:pad_fundation/widgets/sponsor_card.dart';

import '../../API/profile_api.dart';
import '../../models/event_fund.dart';
import '../../models/kontraprestasi.dart';
import '../../models/sponsor.dart';
import 'daftar_sponsor_mitra.dart';

class DetailEventMitra extends StatefulWidget {

  final Event event;
  final VoidCallback? onTap;

  const DetailEventMitra({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);


  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEventMitra> {
  bool isBookmarked = false;
  int currentBatch = 0;

  String getTotalAmount(List<Sponsor> sponsors) {
    final totalAmount = sponsors.fold<int>(0, (total, sponsor) => total + sponsor.amount.toInt());
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatCurrency.format(totalAmount);
  }

  String getTarget(EventFund? eventFund) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    if (eventFund?.targetFund != null) {
      return formatCurrency.format(eventFund!.targetFund);
    } else {
      return '???';
    }
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


    Widget header() {
      return Container(
        child: Stack(
          children: [
            ClipRRect(
              child:
              Image.network(
                event.eventPhotos.isNotEmpty
                    ? event.eventPhotos.first.photoFile
                    : 'https://via.placeholder.com/150',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/img_kochella.png',
                    width: double.infinity, // Sesuaikan dengan Image.network
                    height: 300,
                    fit: BoxFit.cover,
                  );
                },
              ),

            ),
          ],
        ),
      );
    }

    Widget title() {
      final bool hasFullLocation = placement != null
          && placement.eventVenue.isNotEmpty
          && placement.address.isNotEmpty
          && placement.city.isNotEmpty
          && placement.province.isNotEmpty;

      final String locationText = hasFullLocation
          ? '${placement!.eventVenue}, ${placement.address}, ${placement.city}, ${placement.province}'
          : 'TO BE ANNOUNCED';

      return Container(
        margin: EdgeInsets.only(top: 20),
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
                      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Image.asset('assets/icon_calendar.png', width: 16),
                SizedBox(width: 4),
                Text(
                  event.eventPlacement?.eventStartDate != null
                      ? DateFormat('dd MMM yyyy').format(DateTime.parse(event.eventPlacement!.eventStartDate))
                      : '-',
                  style: greenTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              'dari ${event.organizer.organization.name}',
              style: grayTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            ),
            SizedBox(height: 4),
            Text(
              'di $locationText',
              style: lighGrayTextStyle.copyWith(
                fontSize: 10,
                fontWeight: regular,
              ),
            ),

            SizedBox(height: 10),
            Text(
              '${getTotalAmount(event.sponsors)} terkumpul dari ${getTarget(event.eventFund)}',
              style: grayTextStyle.copyWith(
                  fontSize: 12, fontWeight: regular),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset('assets/icon_donorship.png', width: 20),
                SizedBox(width: 4),
                Text(
                  '${getTotalSponsors(event.sponsors)} Donorship',
                  style: veryLightGrayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(width: 18),
                Image.asset('assets/icon_timer.png', width: 16),
                SizedBox(width: 4),
                Text(
                  event.eventPlacement?.eventStartDate != null
                      ? '${getDaysRemaining(event.eventPlacement!.eventStartDate)} hari lagi'
                      : 'Tanggal belum ditentukan',
                  style: veryLightGrayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: getProgress(event) / 100,
                      backgroundColor: lineColor2,
                      valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${getProgress(event).toStringAsFixed(2)}%',
                  style: blackTextStyle.copyWith(fontSize: 10, fontWeight: regular),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget whiteLine() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        height: 2,
        color: navbarColor,
      );
    }

    Widget audienceTargetTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Target Audiens',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget audienceTarget() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Image.asset('assets/icon_audiens.png', width: 24),
            SizedBox(width: 10),
            Text(
              '${event.targetParticipant.toString()} ${event.participantName}',
              style: lighGrayTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      );
    }

    Widget aboutEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Tentang Event',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget aboutEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          event.description,
          textAlign: TextAlign.justify,
          style: lighGrayTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget eventCategories() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 5,
            children: [
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
      );
    }

    Widget informationDetailTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Galeri Detail Informasi',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget informationDetail() {
     return Container(
       child: InformationDetailWidget(eventId: event.id.toString()),
     );
    }

    Widget kontraprestasiTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'KontraPrestasi',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget kontraprestasi() {
      return Container(
        child: KontraprestasiCategory(kontraprestasis: event.kontraprestasis),
      );
    }

    Widget sponsorTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sponsor',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarSponsorMitra(
                      sponsors: event.sponsors,             // List<Sponsor> yang kamu punya
                      kontraprestasis: event.kontraprestasis, // List<Kontraprestasi>
                    ),
                  ),
                );
              },
              child: Text(
                'Selengkapnya',
                style: grayTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: regular,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget sponsor(List<Sponsor> sponsors, List<Kontraprestasi> kontraprestasis) {
      // Kelompokkan sponsor berdasarkan level (kontraprestasi)
      Map<String, List<Sponsor>> groupedSponsors = {};

      for (var kontraprestasi in kontraprestasis) {
        final group = sponsors.where((s) {
          return (s.amount ?? 0) >= (kontraprestasi.minSponsor ?? 0) &&
              (s.amount ?? 0) <= (kontraprestasi.maxSponsor ?? 0);
        }).toList();

        if (group.isNotEmpty) {
          groupedSponsors[kontraprestasi.title ?? 'Unknown'] = group;
        }
      }

      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: groupedSponsors.entries.map((entry) {
            String category = entry.key;
            List<Sponsor> sponsorsInCategory = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                ...sponsorsInCategory.take(2).map((sponsor) {
                  final mitra = sponsor.entrepreneur?.mitra;
                  final imageUrl = mitra != null
                      ? mitra.photoFile.startsWith('http')
                        ? mitra.photoFile
                        : '${ProfileApi.photourl}${mitra.photoFile ?? ''}'
                      : 'assets/img_profile_picture.png';

                  print('Image URL: $imageUrl');

                  return SponsorCard(
                    imageUrl: imageUrl,
                    name: mitra?.name ?? 'Unknown',
                    iconUrl: 'assets/icon_${category.toLowerCase()}.png',
                    category: category,
                    amount: 'Rp${NumberFormat("#,##0", "id_ID").format(sponsor.amount)}',
                  );
                }).toList(),
                SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title(),
                            ],
                          ),
                        ),
                        whiteLine(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              audienceTargetTitle(),
                              audienceTarget(),
                              aboutEventTitle(),
                              aboutEvent(),
                              eventCategories(),
                              informationDetailTitle(),
                              informationDetail(),
                              kontraprestasiTitle(),
                              kontraprestasi(),
                              sponsorTitle(),
                              sponsor(event.sponsors, event.kontraprestasis),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5,15, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/detail-chat-event-mitra');
                            print('chat');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(50, 50),
                          ),
                          child: Image.asset(
                            'assets/icon_chat_2.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/kirim-sponsor-mitra');
                              print('ajukan dari mitra');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(0, 50),
                            ),
                            child: Text(
                              'AJUKAN SPONSOR',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2.5, 17.5, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            'assets/icon_tanda_panah_kiri.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     showConfirmationDialog(context);
                      //   },
                      //   child: Container(
                      //     width: 25,
                      //     height: 25,
                      //     decoration: BoxDecoration(
                      //       color: backgroundColor,
                      //       borderRadius: BorderRadius.circular(100),
                      //     ),
                      //     child: Image.asset(
                      //       'assets/icon_download.png',
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(width: 15),
                      GestureDetector(
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              'Download Berhasil!',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

}