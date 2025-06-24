import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/event_tile_mitra.dart';
import 'package:pad_fundation/widgets/organizer/event_tile_organizer.dart';
import '../../models/event.dart';

class SearchResultPageMitra extends StatefulWidget {
  final List<Event> allEvents;
  final String searchQuery;

  const SearchResultPageMitra({
    Key? key,
    required this.allEvents,
    required this.searchQuery,
  }) : super(key: key);

  @override
  _SearchResultPageMitraState createState() => _SearchResultPageMitraState();
}

class _SearchResultPageMitraState extends State<SearchResultPageMitra> {
  List<Event> _filteredEvents = [];

  @override
  void initState() {
    super.initState();
    _filterEvents(widget.searchQuery);
  }

  void _filterEvents(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _filteredEvents = widget.allEvents.where((event) {
        return event.title.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  PreferredSizeWidget buildHeader(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        flexibleSpace: Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/icon_panah_kiri.png', width: 8),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Hasil Pencarian',
                    style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
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

  Widget buildEventList() {
    if (_filteredEvents.isEmpty) {
      return const Center(child: Text('No event found.'));
    } else {
      return SingleChildScrollView(
        child: Column(
          children: _filteredEvents.map((event) {
            return EventTileMitra(
              event: event,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detail-event-mitra',
                  arguments: event,
                );
              },
            );
          }).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildHeader(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          buildEventList(),
        ],
      ),
    );
  }
}
