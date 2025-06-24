import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/event_card_big_organizer.dart';
import '../../API/event_api.dart';
import '../../models/event.dart';
import '../../widgets/filter_sidebar.dart';

class EventByCategoryOrganizer extends StatefulWidget {
  final Function(String)? onSearchChanged;
  final Function(BuildContext)? onFilterPressed;

  EventByCategoryOrganizer({
    this.onSearchChanged,
    this.onFilterPressed,
  });

  @override
  _EventByCategoryOrganizerState createState() => _EventByCategoryOrganizerState();
}

class _EventByCategoryOrganizerState extends State<EventByCategoryOrganizer> {
  List<Event> _allEvents = [];
  List<Event> _filteredEvents = [];
  String _searchQuery = '';
  bool _isLoading = true;
  String? _error;

  late int categoryId;
  String categoryName = '';

  // Daftar kategori yang sesuai dengan categoryId
  final Map<int, String> categoryNames = {
    1: 'Kuliner',
    2: 'Festival',
    3: 'Pendidikan',
    4: 'Seniman',
  };


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      categoryId = args;
      categoryName = categoryNames[categoryId] ?? 'Unknown';
      print('Category ID from arguments: $categoryId');
      print('Category Name: $categoryName');
      _fetchEvents();
    } else {
      categoryId = 0;
      categoryName = 'Unknown';
      print('Invalid categoryId, defaulted to 0');
    }
  }

  Future<void> _fetchEvents() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      List<Event> events;
      if (categoryId == 5) {
        // Kategori Populer
        events = await EventApi.fetchPopularEvents();
      } else {
        // Kategori lain berdasarkan ID
        events = await EventApi.getEventsByCategory(categoryId);
      }

      setState(() {
        _allEvents = events;
        _filteredEvents = events;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    _searchQuery = query.toLowerCase();
    setState(() {
      _filteredEvents = _allEvents.where((event) {
        final nameLower = event.title.toLowerCase();
        // final descriptionLower = event.description?.toLowerCase() ?? '';
        // return nameLower.contains(_searchQuery) || descriptionLower.contains(_searchQuery);
        return nameLower.contains(_searchQuery);
      }).toList();
    });
  }

  PreferredSizeWidget buildHeader(BuildContext context) {
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
                              onChanged: _onSearchChanged,
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
                  // TextButton(
                  //   onPressed: () {
                  //     if (widget.onFilterPressed != null) {
                  //       widget.onFilterPressed!(context);
                  //     }
                  //   },
                  //   style: TextButton.styleFrom(
                  //     backgroundColor: textColor3,
                  //     minimumSize: Size(50, 50),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   child: Image.asset('assets/icon_filter.png', width: 24),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildHeader(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Text(
            'Event $categoryName',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 17),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _error != null
                ? Center(child: Text('Error: $_error'))
                : _filteredEvents.isEmpty
                ? Center(child: Text('No events found'))
                : SingleChildScrollView(
              child: Column(
                children: _filteredEvents.map((event) {
                  return EventCardBigOrganizer(
                    event: event,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detail-event-organizer',
                      arguments: event,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
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

