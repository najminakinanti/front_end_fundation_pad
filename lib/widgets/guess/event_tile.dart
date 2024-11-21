import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class EventTile extends StatelessWidget {
  final String imagePath;
  final String status;
  final String title;
  final String collectedAmount;
  final double progress;
  final int daysRemaining;
  final int donorshipCount;
  final String date;
  final List<String> categories;
  final VoidCallback? onTap;

  const EventTile({
    Key? key,
    required this.imagePath,
    required this.status,
    required this.title,
    required this.collectedAmount,
    required this.progress,
    required this.daysRemaining,
    required this.donorshipCount,
    required this.date,
    required this.categories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pushNamed(context, '/detail-event'),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 135,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: sageGreen4,
            width: 1.0,
          ),
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
                          title,
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
                          style: lighGrayTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      collectedAmount,
                      style: lighGrayTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: lineColor2,
                              valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: blackTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset('assets/icon_donorship.png', width: 18),
                        SizedBox(width: 4),
                        Text(
                          '$donorshipCount Donorship',
                          style: veryLightGrayTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/icon_timer.png', width: 13),
                        SizedBox(width: 4),
                        Text(
                          '$daysRemaining hari lagi',
                          style: veryLightGrayTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
