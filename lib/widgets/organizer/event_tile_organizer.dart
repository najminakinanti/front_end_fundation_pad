import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/pages/organizer_page/detail_event_organizer.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/category_button.dart';

import '../../API/event_api.dart';
import '../../models/event.dart';
import '../../models/sponsor.dart';

class EventTileOrganizer extends StatefulWidget {
  final Event event;
  final VoidCallback? onTap;

  const EventTileOrganizer({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);

  @override
  _EventTileOrganizerState createState() => _EventTileOrganizerState();
}

class _EventTileOrganizerState extends State<EventTileOrganizer> {
  bool isBookmarked = false;

  String getTotalAmount(List<Sponsor> sponsors) {
    final totalAmount = sponsors.fold<int>(0, (total, sponsor) => total + sponsor.amount.toInt());
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatCurrency.format(totalAmount);
  }

  int getTotalSponsors(List<Sponsor> sponsors) {
    return sponsors.length;
  }

  int getDaysRemaining(String eventStartDate) {
    DateTime startDate = DateTime.parse(eventStartDate);
    DateTime currentDate = DateTime.now();
    Duration difference = startDate.difference(currentDate);
    return difference.inDays;
  }

  double getProgress(Event event) {
    String totalAmountStr = getTotalAmount(event.sponsors).replaceAll('Rp', '').replaceAll('.', '').trim();
    double totalAmount = double.parse(totalAmountStr);
    double targetFund = (event.eventFund?.targetFund ?? 0).toDouble();

    if (targetFund == 0) {
      return 0;
    }

    return (totalAmount / targetFund) * 100;
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return GestureDetector(
      onTap: () async {
        await EventApi.incrementClick(event.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailEventOrganizer(event: event),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 135,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(10),
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
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    event.eventPhotos.isNotEmpty
                        ? event.eventPhotos.first.photoFile
                        : 'https://via.placeholder.com/150',
                    width: 127,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/img_kochella.png',
                        width: 127,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
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
                      event.typeEvent.toUpperCase(),
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
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            event.title,
                            style: grayTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset('assets/icon_calendar.png', width: 11),
                        SizedBox(width: 4),
                        Text(
                          event.eventPlacement?.eventStartDate != null
                              ? DateFormat('dd MMM yyyy').format(DateTime.parse(event.eventPlacement!.eventStartDate))
                              : '-',
                          style: lighGrayTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Terkumpul ${getTotalAmount(event.sponsors)}',
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
                              value: getProgress(event) / 100,
                              backgroundColor: lineColor2,
                              valueColor: AlwaysStoppedAnimation<Color>(lineColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${getProgress(event).toStringAsFixed(2)}%',
                          style: blackTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final sponsorWidget = Row(
                          children: [
                            Image.asset('assets/icon_donorship.png', width: 18),
                            const SizedBox(width: 4),
                            Text(
                              '${getTotalSponsors(event.sponsors)} Donorship',
                              style: veryLightGrayTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        );

                        final timerWidget = Row(
                          children: [
                            Image.asset('assets/icon_timer.png', width: 13),
                            const SizedBox(width: 4),
                            Text(
                              event.eventPlacement?.eventStartDate != null
                                  ? '${getDaysRemaining(event.eventPlacement!.eventStartDate)} hari lagi'
                                  : 'Tanggal belum ditentukan',
                              style: veryLightGrayTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        );

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: constraints.maxWidth),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                sponsorWidget,
                                const SizedBox(width: 10),
                                timerWidget,
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 5,
                        children: event.categories
                            .map(
                              (category) => CategoryButton(
                            label: category.name,
                            onTap: () {
                              print(category.name);
                            },
                          ),
                        )
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
