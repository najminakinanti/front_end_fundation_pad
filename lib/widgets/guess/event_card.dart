import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class EventCard extends StatelessWidget {
  final String imagePath;
  final String status;
  final String title;
  final String collectedAmount;
  final double progress;
  final int daysRemaining;
  final int donorshipCount;
  final List<String> categories;
  final VoidCallback? onTap;

  const EventCard({
    Key? key,
    required this.imagePath,
    required this.status,
    required this.title,
    required this.collectedAmount,
    required this.progress,
    required this.daysRemaining,
    required this.donorshipCount,
    required this.categories,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pushNamed(context, '/detail-event'),
      child: Container(
        width: 225,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 100,
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
                      status.toUpperCase(),
                      style: orangeTextStyle.copyWith(
                        fontSize: 10,
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
                  // Event Title
                  Text(
                    title,
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  // Collected Amount
                  Text(
                    'Terkumpul $collectedAmount',
                    style: lighGrayTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: regular,
                    ),
                  ),
                  // Progress Bar
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: lineColor2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              lineColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  // Donorship and Days Remaining
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Row(
                        children: [
                          Image.asset('assets/icon_timer.png', width: 13),
                          const SizedBox(width: 4),
                          Text(
                            '$daysRemaining hari lagi',
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
                  // Categories
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
