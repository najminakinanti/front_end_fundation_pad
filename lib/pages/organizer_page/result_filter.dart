import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/filter_sidebar.dart';
import 'package:pad_fundation/widgets/organizer/event_card_organizer.dart';
import 'package:pad_fundation/widgets/organizer/event_tile_organizer.dart';

import '../../API/event_api.dart';
import '../../API/filter_api.dart';
import '../../models/event.dart';

class ResultFilter extends StatefulWidget {
  const ResultFilter ({Key? key}) : super(key: key);
  @override
  _ResultFilterState createState() => _ResultFilterState();
}

class _ResultFilterState extends State<ResultFilter> {
  List<Event> events = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final filters = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    _loadFilteredEvents(filters);
  }

  Future<void> _loadFilteredEvents(Map<String, dynamic> filters) async {
    try {
      Map<String, bool> selectedCategories = Map<String, bool>.from(filters['categories']);
      Map<String, bool> selectedFundRanges = Map<String, bool>.from(filters['fundRanges']);

      Map<String, int> categoryMap = {
        'Kuliner': 1,
        'Festival': 2,
        'Pendidikan': 3,
        'Seniman': 4,
      };

      Map<String, String> fundRangeValues = {
        '<10.000.000': '<10000000',
        '<20.000.000': '<20000000',
        '<50.000.000': '<50000000',
        '<100.000.000': '<100000000',
        '≥100.000.000': '>=100000000',
      };

      List<int> categoryIds = selectedCategories.entries
          .where((e) => e.value)
          .map((e) => categoryMap[e.key]!)
          .toList();

      String? selectedDisplay = selectedFundRanges.entries.firstWhere(
            (e) => e.value == true,
        orElse: () => const MapEntry('', false),
      ).key;

      String? fundRange = fundRangeValues[selectedDisplay];

      if (fundRange == '') fundRange = null;

      final fetched = await FilterApi.fetchFilteredEvents(
        categoryIds: categoryIds,
        fundRange: fundRange,
      );

      setState(() {
        events = fetched;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
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
      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (errorMessage != null) {
        return Center(child: Text('Error: $errorMessage'));
      } else if (events.isEmpty) {
        return const Center(child: Text('No events found'));
      } else {
        return SingleChildScrollView(
          child: Column(
            children: events
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
