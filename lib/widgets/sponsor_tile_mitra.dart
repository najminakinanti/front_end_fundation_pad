import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class SponsorTileMitra extends StatelessWidget {
  final List<String> kontraprestasiImages = [
    'assets/img_kontraprestasi_1.png',
    'assets/img_kontraprestasi_2.png',
    'assets/img_kontraprestasi_1.png',
  ];

  final double imageHeight = 350;
  final double arrowHeight = 24;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-event-mitra');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 135,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: navbarColor,
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
                  child: Image.asset(
                    'assets/img_music_fest.png',
                    width: 127,
                    height: double.infinity,
                    fit: BoxFit.cover,
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
                      'OFFLINE',
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
                        Text(
                          'Music Fest 2024',
                          style: grayTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/icon_calendar.png', width: 11),
                        SizedBox(width: 4),
                        Text(
                          '20 Mei 2024',
                          style: veryLightGrayTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jakarta, Jalan Kamboja',
                      style: lighGrayTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
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
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
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
                              SizedBox(width: 4),
                              Text(
                                '10 juta',
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
                            _showLargeImage(context, kontraprestasiImages, 0);
                          },
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

  void _showLargeImage(BuildContext context, List<String> imagePaths, int initialIndex) {
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
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
                      "Bukti Kontraprestasi MusicFest",
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePaths[currentIndex],
                        height: imageHeight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Umbul-Umbul Tampak Depan",
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
              // Left arrow
              Positioned(
                top: (imageHeight / 2) - (arrowHeight / 2) + 55,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex > 0) {
                      currentIndex--;
                      Navigator.of(context).pop();
                      _showLargeImage(context, imagePaths, currentIndex);
                    }
                  },
                  child: Image.asset(
                    'assets/icon_button_panah_kiri.png',
                    width: 24,
                  ),
                ),
              ),
              // Right arrow
              Positioned(
                top: (imageHeight / 2) - (arrowHeight / 2) + 55,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex < imagePaths.length - 1) {
                      currentIndex++;
                      Navigator.of(context).pop();
                      _showLargeImage(context, imagePaths, currentIndex);
                    }
                  },
                  child: Image.asset(
                    'assets/icon_button_panah_kanan.png',
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
