import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import '../../widgets/filter_sidebar.dart';

class EventByCategory extends StatelessWidget {
  final String title;
  final List<Widget> eventCards;
  final Function(String)? onSearchChanged;
  final Function(BuildContext)? onFilterPressed;

  EventByCategory({
    required this.title,
    required this.eventCards,
    this.onSearchChanged,
    this.onFilterPressed,
  });

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
                              onChanged: onSearchChanged,
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
                      if (onFilterPressed != null) {
                        onFilterPressed!(context);
                      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildHeader(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 17),
          ...eventCards,
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

