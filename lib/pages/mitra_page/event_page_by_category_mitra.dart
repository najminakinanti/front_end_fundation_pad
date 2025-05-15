import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/filter_sidebar.dart';

import '../../API/event_api.dart';
import '../../models/event.dart';
import '../../widgets/mitra/event_card_big_mitra.dart';
import '../../widgets/mitra/event_card_mitra.dart';

class EventPageByCategoryMitra extends StatefulWidget {
  @override
  _EventPageByCategoryMitraState createState() => _EventPageByCategoryMitraState();
}

class _EventPageByCategoryMitraState extends State<EventPageByCategoryMitra> {
  late Future<List<Event>> popularEvents;

  @override
  void initState() {
    super.initState();
    popularEvents = EventApi.fetchPopularEvents();
  }

  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icon_panah_kiri.png',
                        width: 8,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Events',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                          color: textColor3,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icon_search.png', width: 18),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {

                                },
                                style: veryLightGrayTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Cari Event',
                                  hintStyle: veryLightGrayTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        showModalRightSheet(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: textColor3,
                        minimumSize: Size(50, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Image.asset('assets/icon_filter.png', width: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget topEventTitle() {
      return Container(
        child: Text(
          'Event Populer',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget topEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: FutureBuilder<List<Event>>(
          future: popularEvents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No popular events found');
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data!
                      .take(10)
                      .map((event) => EventCardMitra(
                    event: event,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail-event-mitra',
                        arguments: event,
                      );
                    },
                  ))
                      .toList(),
                ),
              );
            }
          },
        ),
      );
    }

    Widget festivalEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Festival',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget festivalEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Event>>(
            future: EventApi.getEventsByCategory(2),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final events = snapshot.data ?? [];
              if (events.isEmpty) {
                return Center(child: Text('No events found', style: blackTextStyle.copyWith(fontSize: 13, fontWeight: regular),));
              }

              return SingleChildScrollView(
                child: Row(
                  children: events.map((event) {
                    return EventCardMitra(
                      event: event,
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail-event-mitra',
                        arguments: event,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      );
    }

    Widget kulinerEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Kuliner',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget kulinerEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Event>>(
            future: EventApi.getEventsByCategory(1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final events = snapshot.data ?? [];
              if (events.isEmpty) {
                return Center(child: Text('No events found', style: blackTextStyle.copyWith(fontSize: 13, fontWeight: regular),));
              }

              return SingleChildScrollView(
                child: Row(
                  children: events.map((event) {
                    return EventCardMitra(
                      event: event,
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail-event-mitra',
                        arguments: event,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      );
    }

    Widget pendidikanEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Pendidikan',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget pendidikanEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Event>>(
            future: EventApi.getEventsByCategory(3),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final events = snapshot.data ?? [];
              if (events.isEmpty) {
                return Center(child: Text('No events found', style: blackTextStyle.copyWith(fontSize: 13, fontWeight: regular),));
              }

              return SingleChildScrollView(
                child: Row(
                  children: events.map((event) {
                    return EventCardMitra(
                      event: event,
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail-event-mitra',
                        arguments: event,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      );
    }

    Widget senimanEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Seniman',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget senimanEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Event>>(
            future: EventApi.getEventsByCategory(4),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final events = snapshot.data ?? [];
              if (events.isEmpty) {
                return Center(child: Text('No events found', style: blackTextStyle.copyWith(fontSize: 13, fontWeight: regular),));
              }

              return SingleChildScrollView(
                child: Row(
                  children: events.map((event) {
                    return EventCardMitra(
                      event: event,
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail-event-mitra',
                        arguments: event,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          topEventTitle(),
          topEvent(),
          festivalEventTitle(),
          festivalEvent(),
          kulinerEventTitle(),
          kulinerEvent(),
          pendidikanEventTitle(),
          pendidikanEvent(),
          senimanEventTitle(),
          senimanEvent(),
          SizedBox(height: 30),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
    );
  }

  void showModalRightSheet(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: FilterSidebar(
            onApply: (filters) {
              print('Selected Filters: $filters');
            },
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset(0, 0),
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}