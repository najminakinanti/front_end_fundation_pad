import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/guess/event_card.dart';
import 'package:pad_fundation/widgets/guess/event_tile.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onNavigateToEvent;

  HomePage({required this.onNavigateToEvent});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: lighGrayTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
            SizedBox(height: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Fundation: ',
                    style: greenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Platform Sponsorship ',
                    style: orangeTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Funding',
                    style: greenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget searchBar() {
      return Padding(
        padding: EdgeInsets.only(top: 18),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(
            color: textColor3,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset('assets/icon_search.png', width: 18),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (value) {

                  },
                  style: veryLightGrayTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Cari Event',
                    hintStyle: veryLightGrayTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget promotion() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Punya Event?',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jadilah Partner Kami',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Daftar sekarang dan rasakan keuntungan menjadi bagian dari kami',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 35,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register-organizer');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'DAFTAR SEKARANG',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Image.asset(
                            'assets/icon_panah_kanan.png',
                            width: 6,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/img_promotion.png',
              height: 160,
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/festival');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_festival.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Festival',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/kuliner');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_kuliner.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kuliner',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pendidikan');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_pendidikan.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pendidikan',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/seniman');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_seniman.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Seniman',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-page-by-category');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_lainnya.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lainnya',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget popularEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event Populer',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/populer');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(width: 2),
                    Image.asset(
                      'assets/icon_tanda_panah_kanan.png',
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget popularEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventCard(
                imagePath: 'assets/img_music_fest.png',
                status: 'Offline',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Festival',
                  'Musik',
                  'EDM',
                  'Hiburan',
                  'DJ',
                  'Live'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventCard(
                imagePath: 'assets/img_educ_fest.png',
                status: 'Online',
                title: 'Educ Fest 2024',
                collectedAmount: 'Rp10.000.000',
                progress: 0.95,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Pendidikan',
                  'Seminar',
                  'Konsultasi',
                  'Formal'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventCard(
                imagePath: 'assets/img_kulfood.png',
                status: 'Offline',
                title: 'KulFood 2024',
                collectedAmount: 'Rp50.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Festival',
                  'Kuliner',
                  'Kompetisi',
                  'Live Musik',
                  'Live'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget allEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Semua Event',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: () {
                  onNavigateToEvent();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(width: 2),
                    Image.asset(
                      'assets/icon_tanda_panah_kanan.png',
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget allEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventTile(
                imagePath: 'assets/img_collegefair.png',
                status: 'ONLINE',
                title: 'COLLEGEFAIR 24',
                collectedAmount: 'Terkumpul Rp900.000',
                progress: 0.4,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Pendidikan', 'Seminar', 'Karir', 'Konseling'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventTile(
                imagePath: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                title: 'Music Fest 2024',
                collectedAmount: 'Terkumpul Rp90.000.000',
                progress: 0.8,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Musik', 'Festival','Hiburan', 'DJ', 'Live', 'EDM'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventTile(
                imagePath: 'assets/img_kochella.png',
                status: 'OFFLINE',
                title: 'KoChella 2024',
                collectedAmount: 'Terkumpul Rp90.000.000',
                progress: 0.75,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Musik', 'Festival', 'Budaya', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventTile(
                imagePath: 'assets/img_foodfest.png',
                status: 'OFFLINE',
                title: 'Food Fest 2024 ',
                collectedAmount: 'Terkumpul Rp15.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Makanan', 'Minuman', 'Musik', 'Art'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          header(),
          searchBar(),
          promotion(),
          categories(),
          popularEventTitle(),
          popularEvent(),
          allEventTitle(),
          allEvent(),
          SizedBox(height: 80)
        ],
      ),
    );
  }
}