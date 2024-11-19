import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/organizer_page/calendar_add_event.dart';
import 'package:pad_fundation/pages/organizer_page/check_add_event.dart';
import 'package:pad_fundation/pages/organizer_page/edit_event_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/file_add_event.dart';
import 'package:pad_fundation/pages/organizer_page/handshake_add_event.dart';
import 'package:pad_fundation/pages/organizer_page/money_add_event.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/kontraprestasi_category.dart';
import 'package:pad_fundation/widgets/organizer/event_card_bookmark_organizer.dart';

class EventFormStepper extends StatefulWidget {
  @override
  _EventFormStepperState createState() => _EventFormStepperState();
}

class _EventFormStepperState extends State<EventFormStepper> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
    });
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget customStepper() {
    List<String> stepIcons = [
      'assets/icon_file.png',
      'assets/icon_calendar (2).png',
      'assets/icon_money.png',
      'assets/icon_handshake.png',
      'assets/icon_check (2).png',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(stepIcons.length * 2 - 1, (index) {
        if (index % 2 == 0) {
          int stepIndex = index ~/ 2;
          return GestureDetector(
            onTap: stepIndex == stepIcons.length - 1
                ? null
                : () {
              _goToPage(stepIndex);
            },
            child: Image.asset(
              stepIcons[stepIndex],
              color: stepIndex <= _currentPage ? primaryColor : grayStepper,
            ),
          );
        } else {
          int lineIndex = (index - 1) ~/ 2;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: lineIndex < _currentPage ? primaryColor : grayStepper,
                thickness: 3,
              ),
            ),
          );
        }
      }),
    );
  }

  PreferredSize header() {
    return PreferredSize(
      preferredSize: Size.fromHeight(133.0),
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
                      showConfirmationDialog(context);
                    },
                    child: Image.asset(
                      'assets/icon_panah_kiri.png',
                      width: 8,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Tambah Event',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              customStepper(),
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
      appBar: header(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  if (_currentPage == 0) FileAddEvent(),
                  if (_currentPage == 1) CalendarAddEvent(),
                  if (_currentPage == 2) MoneyAddEvent(),
                  if (_currentPage == 3) HandshakeAddEvent(),
                  if (_currentPage == 4) CheckAddEvent(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      child: ElevatedButton(
                        onPressed: () => _goToPage(_currentPage - 1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: sageGreen3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          'Sebelumnya',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  if (_currentPage < 4) // Page 0 to 3
                    SizedBox(
                      width: _currentPage == 0
                          ? MediaQuery.of(context).size.width - 60
                          : MediaQuery.of(context).size.width / 2 - 35,
                      child: ElevatedButton(
                        onPressed: () => _goToPage(_currentPage + 1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          'Selanjutnya',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  if (_currentPage == 4) // Last page
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      child: ElevatedButton(
                        onPressed: () {
                          showSaveConfirmationDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Batal',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
          content: Container(
            width: 250,
            child: Text(
              'Apakah Anda yakin ingin batal membuat event?',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'BATAL',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/home-organizer',
                  arguments: 1,
                );
              },
              child: Text(
                'YA',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSaveConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 250,
            child: Text(
              'Event berhasil ditambahkan!',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(30, 40, 15, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/home-organizer',
                  arguments: 1,
                );
              },
              child: Text(
                'OK',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ),
          ],
        );
      },
    );
  }
}
