import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class EventCardBookmarkOrganizer extends StatefulWidget {
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

  const EventCardBookmarkOrganizer({
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
  _EventCardBookmarkOrganizerState createState() => _EventCardBookmarkOrganizerState();
}

class _EventCardBookmarkOrganizerState extends State<EventCardBookmarkOrganizer> {
  bool isBookmarked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
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
                    widget.imageUrl,
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
                      widget.status,
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
                  Row(
                    children: [
                      Text(
                        widget.eventName,
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/icon_calendar.png', width: 11),
                      SizedBox(width: 4),
                      Text(
                        widget.date,
                        style: lighGrayTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
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
                            valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${(widget.progress * 100).toInt()}%',
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
                      Image.asset('assets/icon_donorship.png', width: 18),
                      SizedBox(width: 4),
                      Text(
                        '${widget.donorshipCount} Donorship',
                        style: veryLightGrayTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/icon_timer.png', width: 13),
                      SizedBox(width: 4),
                      Text(
                        '${widget.daysLeft} hari lagi',
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
