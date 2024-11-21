import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class SponsorTileMitra extends StatelessWidget {
  final String imagePath;
  final String status;
  final String eventName;
  final String date;
  final String location;
  final List<String> categories;
  final String kontraprestasiAmount;
  final List<String> kontraprestasiImages;

  const SponsorTileMitra({
    Key? key,
    required this.imagePath,
    required this.status,
    required this.eventName,
    required this.date,
    required this.location,
    required this.categories,
    required this.kontraprestasiAmount,
    required this.kontraprestasiImages,
  }) : super(key: key);

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
                    imagePath,
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
                      status,
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
                          eventName,
                          style: grayTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/icon_calendar.png', width: 11),
                        SizedBox(width: 4),
                        Text(
                          date,
                          style: veryLightGrayTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      location,
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
                        children: categories
                            .map((category) => CategoryButton(
                          label: category,
                          onTap: () {
                            print(category);
                          },
                        ))
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 12),
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
                                '$kontraprestasiAmount juta',
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

  void _showLargeImage(
      BuildContext context, List<String> imagePaths, int initialIndex) {
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePaths[currentIndex],
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              // Arrows
              if (currentIndex > 0)
                Positioned(
                  top: 190,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      currentIndex--;
                      Navigator.of(context).pop();
                      _showLargeImage(context, imagePaths, currentIndex);
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
                      currentIndex++;
                      Navigator.of(context).pop();
                      _showLargeImage(context, imagePaths, currentIndex);
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
