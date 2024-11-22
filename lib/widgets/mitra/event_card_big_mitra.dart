import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

class EventCardBigMitra extends StatefulWidget {
  final String imageUrl;
  final String status;
  final String title;
  final String date;
  final String amountCollected;
  final double percentage;
  final int donorshipCount;
  final String remainingDays;
  final List<String> categories;
  final VoidCallback? onTap;

  const EventCardBigMitra({
    Key? key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.date,
    required this.amountCollected,
    required this.percentage,
    required this.donorshipCount,
    required this.remainingDays,
    required this.categories,
    this.onTap,
  }) : super(key: key);

  @override
  _EventCardBigMitraState createState() => _EventCardBigMitraState();
}

class _EventCardBigMitraState extends State<EventCardBigMitra> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () => Navigator.pushNamed(context, '/detail-event-mitra'),
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
                        widget.title,
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
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Terkumpul ${widget.amountCollected}',
                    style: lighGrayTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: widget.percentage,
                            backgroundColor: lineColor2,
                            valueColor:
                            AlwaysStoppedAnimation<Color>(lineColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${(widget.percentage * 100).toInt()}%',
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
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
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Image.asset('assets/icon_timer.png', width: 13),
                          SizedBox(width: 4),
                          Text(
                            '${widget.remainingDays} hari lagi',
                            style: veryLightGrayTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
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
