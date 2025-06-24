import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/guess/event_card.dart';
import 'package:pad_fundation/widgets/guess/event_tile.dart';

import '../../../API/event_api.dart';
import '../../../models/event.dart';
import '../../../widgets/filter_sidebar.dart';
import '../search_result_page.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String selectedCategory = '';
  late Future<List<Event>> events;
  late Future<List<Event>> popularEvents;
  String? photo_file;
  File? _imageFile;
  Uint8List? _imageBytes;

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Widget buildCategoryContent() {
    switch (selectedCategory) {
      case 'festival':
        return Text('Konten Festival');
      case 'kuliner':
        return Text('Konten Kuliner');
      case 'pendidikan':
        return Text('Konten Pendidikan');
      case 'seniman':
        return Text('Konten Seniman');
      case 'lainnya':
        return Text('Konten Lainnya');
      default:
        return SizedBox();
    }
  }

  @override
  void initState() {
    super.initState();
    events = EventApi.fetchEvents();
    popularEvents = EventApi.fetchPopularEvents();
  }

  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                                onSubmitted: (value) async {
                                  if (value.trim().isNotEmpty) {
                                    final allEventsList = await events; // tunggu Future selesai

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchResultPage(
                                          allEvents: allEventsList,
                                          searchQuery: value.trim(),
                                        ),
                                      ),
                                    );
                                  }
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
          'Top Event',
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
                      .map((event) => EventCard(
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

    Widget allEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Semua Event',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget allEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: FutureBuilder<List<Event>>(
          future: events,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No events found'));
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: snapshot.data!
                      .take(4)
                      .map(
                        (event) => EventTile(
                      event: event,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail-event',
                          arguments: event,
                        );
                      },
                    ),
                  )
                      .toList(),
                ),
              );
            }
          },
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          topEventTitle(),
          topEvent(),
          allEventTitle(),
          allEvent(),
          SizedBox(height: 80),
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