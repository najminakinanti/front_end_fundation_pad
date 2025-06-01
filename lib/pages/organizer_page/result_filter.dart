import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/filter_sidebar.dart';
import 'package:pad_fundation/widgets/organizer/event_card_organizer.dart';
import 'package:pad_fundation/widgets/organizer/event_tile_organizer.dart';

import '../../API/event_api.dart';
import '../../models/event.dart';

class ResultFilter extends StatefulWidget {
  @override
  _ResultFilterState createState() => _ResultFilterState();
}

class _ResultFilterState extends State<ResultFilter> {
  late Future<List<Event>> events;

  @override
  void initState() {
    super.initState();
    events = EventApi.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 0),
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
              ],
            ),
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
                  // .take(4)
                      .map(
                        (event) => EventTileOrganizer(
                      event: event,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail-event-organizer',
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
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        children: [
          allEvent(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
    );
  }
}
