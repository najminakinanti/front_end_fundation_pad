import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';
import 'package:pad_fundation/widgets/information_detail_galery.dart';
import 'package:pad_fundation/widgets/kontraprestasi_category.dart';
import 'package:pad_fundation/widgets/sponsor_card.dart';

class DetailEventMitra extends StatefulWidget {
  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEventMitra> {
  bool isBookmarked = false;
  int currentBatch = 0;

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        child: Stack(
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/img_music_fest.png',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Mufest 2024',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: bold),
                ),
                Spacer(),
                Image.asset('assets/icon_calendar.png', width: 16),
                SizedBox(width: 5),
                Text(
                  '20 Mei 2024',
                  style: greenTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              'dari Tech Musicompany',
              style: grayTextStyle.copyWith(
                  fontSize: 14, fontWeight: regular),
            ),
            SizedBox(height: 4),
            Text(
              'di Hall TechCompany, Kulon Progo, Daerah Istimewa Yogyakarta',
              style: lighGrayTextStyle.copyWith(
                  fontSize: 10, fontWeight: regular),
            ),
            SizedBox(height: 10),
            Text(
              'Rp90.000.000 terkumpul dari Rp100.000.000 ',
              style: grayTextStyle.copyWith(
                  fontSize: 12, fontWeight: regular),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset('assets/icon_donorship.png', width: 20),
                SizedBox(width: 4),
                Text(
                  '100 Donorship',
                  style: veryLightGrayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(width: 18),
                Image.asset('assets/icon_timer.png', width: 16),
                SizedBox(width: 4),
                Text(
                  '230 hari lagi',
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
                    child: SizedBox(
                      height: 8,
                      child: LinearProgressIndicator(
                        value: 0.9,
                        backgroundColor: lineColor2,
                        valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '90%',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
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
              '1000 mahasiswa ilmu ekonomi',
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
          'Event Mufest merupakan event yang diadakan setiap tahun dengan bintang tamu yang sedang tren di tiap tahunnya. Di tahun ini acara dilaksankan di Hall Tech Company ',
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
              CategoryButton(
                label: 'Festival',
                onTap: () {
                  print('Festival');
                },
              ),
              CategoryButton(
                label: 'Musik',
                onTap: () {
                  print('Musik');
                },
              ),
              CategoryButton(
                label: 'EDM',
                onTap: () {
                  print('EDM');
                },
              ),
              CategoryButton(
                label: 'Hiburan',
                onTap: () {
                  print('Hiburan');
                },
              ),
              CategoryButton(
                label: 'DJ',
                onTap: () {
                  print('DJ');
                },
              ),
              CategoryButton(
                label: 'Live',
                onTap: () {
                  print('Live');
                },
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
        child: KontraprestasiCategory(),
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
                Navigator.pushNamed(context, '/daftar-sponsor-mitra');
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
            SponsorCard(
              imageUrl: 'assets/img_ozora.png',
              name: 'Ozora Organizer',
              iconUrl: 'assets/icon_gold.png',
              category: 'Gold',
              amount: 'Rp33.000.000',
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
            SponsorCard(
              imageUrl: 'assets/img_space.png',
              name: 'Organizer Event',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp15.000.000',
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
                              sponsor(),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showConfirmationDialog(context);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            'assets/icon_download.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
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
          contentPadding: EdgeInsets.fromLTRB(0, 30, 0, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail-event-mitra');
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