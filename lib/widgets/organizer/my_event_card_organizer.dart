import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class MyEventCardOrganizer extends StatefulWidget {
  @override
  _MyEventCardOrganizerState createState() => _MyEventCardOrganizerState();
}

class _MyEventCardOrganizerState extends State<MyEventCardOrganizer> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-my-event-organizer');
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/img_music_fest.png',
                    width: double.infinity,
                    height: 230,
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
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),

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
                          isBookmarked ? 'assets/icon_bookmark_on.png' : 'assets/icon_bookmark_off.png',
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
                  Row(
                    children: [
                      Text(
                        'Music org 2024',
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      Spacer(),

                      Image.asset('assets/icon_calendar.png', width: 11),
                      SizedBox(width: 4),
                      Text('20 Mei 2024', style: veryLightGrayTextStyle.copyWith(fontSize: 10, fontWeight: regular,),),
                    ],
                  ),

                  Text(
                    'Terkumpul Rp90.000.000',
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
                            value: 0.9,
                            backgroundColor: lineColor2,
                            valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '90%',
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 7),

                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icon_donorship.png', width: 18),
                          SizedBox(width: 4),
                          Text('100 Donorship', style: veryLightGrayTextStyle.copyWith(fontSize: 10, fontWeight: regular,),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          Image.asset('assets/icon_timer.png', width: 13),
                          SizedBox(width: 4),
                          Text('230 hari lagi', style: veryLightGrayTextStyle.copyWith(fontSize: 10, fontWeight: regular,),),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 7),

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}