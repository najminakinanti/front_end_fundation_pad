import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';
import 'package:pad_fundation/widgets/information_detail_galery.dart';
import 'package:pad_fundation/widgets/kontraprestasi_category.dart';
import 'package:pad_fundation/widgets/sponsor_card.dart';

import '../../models/event.dart';
import '../../models/event_fund.dart';
import '../../models/sponsor.dart';

class DetailEvent extends StatefulWidget {

  final Event event;
  final VoidCallback? onTap;

  const DetailEvent({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);


  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
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
              event.targetParticipant.toString(),
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
       child: InformationDetailWidget(),
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
        child: Text(
          'Sponsor',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget sponsor() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gold',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SponsorCard(
              imageUrl: 'assets/img_bittersweet.png',
              name: 'Bittersweet by Najla',
              iconUrl: 'assets/icon_gold.png',
              category: 'Gold',
              amount: 'Rp35.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_the_organizer.png',
              name: 'The Organizer',
              iconUrl: 'assets/icon_gold.png',
              category: 'Gold',
              amount: 'Rp34.000.000',
            ),
            SizedBox(height: 10),
            Text(
              'Silver',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SponsorCard(
              imageUrl: 'assets/img_raorganizer.png',
              name: 'Raorganizer',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp25.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_space.png',
              name: 'Space Organizer',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp20.000.000',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
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
                            sponsor(),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/icon_tanda_panah_kiri.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 15,
            right: 15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/home',
                      arguments: 2,
                    );
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
                      Navigator.pushNamed(context, '/login-mitra');
                      print('ajukan');
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
          )
        ],
      ),
    );
  }
}