import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/event_card_organizer.dart';
import 'package:pad_fundation/widgets/organizer/event_tile_organizer.dart';

class HomePageOrganizer extends StatefulWidget {
  final VoidCallback onNavigateToEvent;
  HomePageOrganizer({required this.onNavigateToEvent});

  @override
  _HomePageOrganizerState createState() => _HomePageOrganizerState();
}

class _HomePageOrganizerState extends State<HomePageOrganizer> {
  bool _isBalanceVisible = true;

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
                backgroundImage: AssetImage('assets/img_profile_org.png'),
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
                    'ORGANIZER NI BOS',
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
                  Navigator.pushNamed(context, '/bookmark-organizer');
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

    Widget yellowSection(BuildContext context) {
      // double screenWidth = MediaQuery.of(context).size.width;
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(17, 7, 0, 7),
                decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total Saldo',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isBalanceVisible = !_isBalanceVisible;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.asset(
                              _isBalanceVisible
                                  ? 'assets/icon_eye_open.png'
                                  : 'assets/icon_eye_close.png',
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _isBalanceVisible ? 'Rp600.000.000' : 'Rp*****',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list-transaksi');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon_tarik_dana.png',
                        height: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Tarik Dana',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                    Navigator.pushNamed(context, '/event-by-category-organizer');
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
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category-organizer');},
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
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category-organizer');},
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
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category-organizer');},
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
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-page-by-category-organizer');},
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
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget myEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event Saya',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: widget.onNavigateToEvent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 10,
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

    Widget myEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventCardOrganizer(),
              EventCardOrganizer(),
              EventCardOrganizer(),
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
                  Navigator.pushNamed(context, '/all-event-organizer');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 10,
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
              EventTileOrganizer(),
              EventTileOrganizer(),
              EventTileOrganizer(),
              EventTileOrganizer(),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        searchBar(),
        yellowSection(context),
        categories(),
        myEventTitle(),
        myEvent(),
        allEventTitle(),
        allEvent(),
        SizedBox(height: 80),
      ],
    );
  }
}