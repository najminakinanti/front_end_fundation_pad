import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class EventCardOrganizer extends StatefulWidget {
  final String imagePath;
  final String status;
  final String title;
  final String collectedAmount;
  final double progress;
  final int daysRemaining;
  final int donorshipCount;
  final List<String> categories;
  final VoidCallback? onTap;

  const EventCardOrganizer({
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
  _EventCardOrganizerState createState() => _EventCardOrganizerState();
}

class _EventCardOrganizerState extends State<EventCardOrganizer> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () => Navigator.pushNamed(context, '/detail-event-organizer'),
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
                    widget.imagePath,
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: sageGreen3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.status.toUpperCase(),
                      style: orangeTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                // Bookmark Icon
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
                          isBookmarked
                              ? 'assets/icon_bookmark_on.png'
                              : 'assets/icon_bookmark_off.png',
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
                  Text(
                    widget.title,
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Terkumpul ${widget.collectedAmount}',
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
                            value: widget.progress,
                            backgroundColor: lineColor2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              lineColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${(widget.progress * 100).toInt()}%',
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icon_donorship.png', width: 18),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.donorshipCount} Donorship',
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
                            '${widget.daysRemaining} hari lagi',
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
                      children: widget.categories
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
