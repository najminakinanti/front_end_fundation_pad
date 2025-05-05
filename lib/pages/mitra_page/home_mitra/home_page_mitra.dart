import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pad_fundation/API/event_api.dart';
import 'package:pad_fundation/models/event.dart';
import 'package:pad_fundation/pages/mitra_page/event_by_category_mitra.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/event_card_mitra.dart';
import 'package:pad_fundation/widgets/mitra/event_tile_mitra.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../API/profile_api.dart';
// import '../event_by_category_page/seniman_page_mitra.dart';

class HomePageMitra extends StatefulWidget {
  @override
  _HomePageMitraState createState() => _HomePageMitraState();
}

class _HomePageMitraState extends State<HomePageMitra> {
  String selectedCategory = '';
  late Future<List<Event>> events;
  Map<String, dynamic>? _userProfile;
  Map<String, dynamic>? _mitraProfile;
  String? fullName;
  String? photo_file;
  File? _imageFile;
  Uint8List? _imageBytes;

  Future<void> _loadProfileFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userIdString = prefs.getString('user_id');

    if (token != null && userIdString != null) {
      int userId = int.parse(userIdString);

      final userData = await ProfileApi.getUserProfile(userId, token);
      if (userData != null) {
        setState(() {
          _userProfile = userData;
          fullName = userData['data']['full_name'];
        });
      }
    }
  }

  Future<void> _loadMitraFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userIdString = prefs.getString('user_id');

    if (token != null && userIdString != null) {
      int userId = int.parse(userIdString);

      final mitraData = await ProfileApi.getMitraProfile(userId, token);
      if (mitraData != null && mounted) {
        setState(() {
          _mitraProfile = mitraData;
          photo_file = mitraData['data']['photo_file'];
        });
      }
    }
  }

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
    _loadProfileFromApi();
    _loadMitraFromApi();
    events = EventApi.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _imageBytes != null
                  ? ClipOval(
                child: Image.memory(
                  _imageBytes!,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              )
                  : ClipOval(
                child: Image.network(
                  '${ProfileApi.photourl}${photo_file ?? ''}',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/img_profile_picture.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              // CircleAvatar(
              //   radius: 25,
              //   backgroundImage: AssetImage('assets/img_bittersweet.png'),
              // ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Have a Great Day!',
                    style: lighGrayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    fullName ?? '',
                    style: greenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bookmark-mitra');
                  print("Bookmark");
                },
                child: Image.asset(
                  'assets/icon_bookmark_2.png',
                  width: 18,
                  height: 18,
                ),
              ),

              SizedBox(width: 16),

              GestureDetector(
                onTap: () {
                  print("notif");
                },
                child: Image.asset(
                  'assets/icon_notification.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget searchBar() {
      return Padding(
        padding: EdgeInsets.only(top: 18),
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
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/event-by-category-mitra',
                      arguments: 2,
                    );
                  },
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/festival-mitra');
                  // },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_festival.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Festival',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/event-by-category-mitra',
                      arguments: 1,
                    );
                  },
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/kuliner-mitra');},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_kuliner.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kuliner',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/event-by-category-mitra',
                      arguments: 3,
                    );
                  },
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/pendidikan-mitra');},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_pendidikan.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pendidikan',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/event-by-category-mitra',
                      arguments: 4,
                    );
                  },
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/seniman-mitra');},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_seniman.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Seniman',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/event-page-by-category-mitra');
                    },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_lainnya.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lainnya',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Widget _buildCategoryItem(BuildContext context, String label, String iconPath, String category) {
    //   return Column(
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(
    //             context,
    //             '/event-by-category-mitra',
    //             arguments: {'category': category},
    //           );
    //         },
    //         child: Container(
    //           padding: EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //             color: backgroundColor3,
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //           child: Image.asset(iconPath, width: 30),
    //         ),
    //       ),
    //       SizedBox(height: 8),
    //       Text(
    //         label,
    //         style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
    //       ),
    //     ],
    //   );
    // }
    //
    //
    // Widget categories(BuildContext context) {
    //   return Container(
    //     margin: EdgeInsets.only(top: 18),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         _buildCategoryItem(context, 'Festival', 'assets/icon_festival.png', 'festival'),
    //         _buildCategoryItem(context, 'Kuliner', 'assets/icon_kuliner.png', 'kuliner'),
    //         _buildCategoryItem(context, 'Pendidikan', 'assets/icon_pendidikan.png', 'pendidikan'),
    //         _buildCategoryItem(context, 'Seniman', 'assets/icon_seniman.png', 'seniman'),
    //         _buildCategoryItem(context, 'Lainnya', 'assets/icon_lainnya.png', 'lainnya'),
    //       ],
    //     ),
    //   );
    // }

    Widget popularEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event Populer',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/populer-mitra');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(width: 2),
                    Image.asset(
                      'assets/icon_tanda_panah_kanan.png',
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget popularEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: FutureBuilder<List<Event>>(
          future: events,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No events found');
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data!
                      .take(3)
                      .map((event) => EventCardMitra(
                    event: event,
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-event-mitra', arguments: event);
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
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Semua Event',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/event-mitra');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(width: 2),
                    Image.asset(
                      'assets/icon_tanda_panah_kanan.png',
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
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
                        (event) => EventTileMitra(
                      event: event,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail-event-mitra',
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

    return ListView(
      children: [
        header(),
        searchBar(),
        categories(),
        popularEventTitle(),
        popularEvent(),
        allEventTitle(),
        allEvent(),
        SizedBox(height: 80),
      ],
    );
  }
}