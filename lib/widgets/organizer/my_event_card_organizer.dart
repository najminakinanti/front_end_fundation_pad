import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class MyEventCardOrganizer extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String eventName;
  final String date;
  final double progress;
  final String collectedAmount;
  final String donorshipCount;
  final String daysLeft;
  final List<String> categories;
  final VoidCallback onTap;

  const MyEventCardOrganizer({
    Key? key,
    required this.imageUrl,
    required this.status,
    required this.eventName,
    required this.date,
    required this.progress,
    required this.collectedAmount,
    required this.donorshipCount,
    required this.daysLeft,
    required this.categories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
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
                    imageUrl,
                    width: double.infinity,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: sageGreen3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: orangeTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
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
                        eventName,
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/icon_calendar.png', width: 11),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: veryLightGrayTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Terkumpul $collectedAmount',
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
                            value: progress,
                            backgroundColor: lineColor2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                lineColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icon_donorship.png', width: 18),
                          const SizedBox(width: 4),
                          Text(
                            '$donorshipCount Donorship',
                            style: veryLightGrayTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Image.asset('assets/icon_timer.png', width: 13),
                          const SizedBox(width: 4),
                          Text(
                            '$daysLeft hari lagi',
                            style: veryLightGrayTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 5,
                      children: categories
                          .map(
                            (category) => CategoryButton(
                          label: category,
                          onTap: () {
                            print(category);
                          },
                        ),
                      )
                          .toList(),
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
