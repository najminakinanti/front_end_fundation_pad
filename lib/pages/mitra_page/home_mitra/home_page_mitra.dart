import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/event_card_mitra.dart';
import 'package:pad_fundation/widgets/mitra/event_tile_mitra.dart';

class HomePageMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/img_bittersweet.png'),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Have a Great Day!',
                    style: lighGrayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Govan Dwi',
                    style: greenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bookmark-mitra');
                  print("Bookmark");
                },
                child: Image.asset(
                  'assets/icon_bookmark_2.png',
                  width: 18,
                  height: 18,
                ),
              ),

              SizedBox(width: 16),

              GestureDetector(
                onTap: () {
                  print("notif");
                },
                child: Image.asset(
                  'assets/icon_notification.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ],
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
                    Navigator.pushNamed(context, '/festival-mitra');
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
                    Navigator.pushNamed(context, '/kuliner-mitra');},
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
                    Navigator.pushNamed(context, '/pendidikan-mitra');},
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
                    Navigator.pushNamed(context, '/seniman-mitra');},
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
                    Navigator.pushNamed(context, '/event-page-by-category-mitra');},
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
        margin: EdgeInsets.only(top: 28),
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
                  Navigator.pushNamed(context, '/populer-mitra');
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
              EventCardMitra(
                imagePath: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Musik', 'EDM', 'Hiburan', 'DJ', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardMitra(
                imagePath: 'assets/img_educ_fest.png',
                status: 'OFFLINE',
                title: 'Educ Fest 2024 ',
                collectedAmount: 'Rp10.000.000',
                progress: 0.95,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Pendidikan', 'Seminar', 'Konsultasi', 'Formal'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardMitra(
                imagePath: 'assets/img_kulfood.png',
                status: 'OFFLINE',
                title: 'KulFood 2024',
                collectedAmount: 'Rp50.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Kompetisi', 'Live Musik', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
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
                  Navigator.pushNamed(context, '/event-mitra');
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
              EventTileMitra(
                imagePath: 'assets/img_collegefair.png',
                status: 'ONLINE',
                title: 'COLLEGEFAIR 24',
                collectedAmount: 'Rp900.000',
                progress: 0.4,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Pendidikan', 'Seminar', 'Karir', 'Konseling'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                  print('Navigate to detail');
                },
              ),
              EventTileMitra(
                imagePath: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp10.000.000',
                progress: 0.8,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Music', 'Festival', 'Hiburan', 'DJ', 'Live', 'EDM'],
                onTap: () {
                  print('Navigate to detail');
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventTileMitra(
                imagePath: 'assets/img_kochella.png',
                status: 'OFFLINE',
                title: 'KoChella 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.75,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Music', 'Festival', 'Budaya', 'Live'],
                onTap: () {
                  print('Navigate to detail');
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventTileMitra(
                imagePath: 'assets/img_foodfest.png',
                status: 'OFFLINE',
                title: 'Food Fest 2024',
                collectedAmount: 'Rp15.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Makanan', 'Minuman', 'Music', 'Art'],
                onTap: () {
                  print('Navigate to detail');
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        searchBar(),
        categories(),
        popularEventTitle(),
        popularEvent(),
        allEventTitle(),
        allEvent(),
        SizedBox(height: 80),
      ],
    );
  }
}