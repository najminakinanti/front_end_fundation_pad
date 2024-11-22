import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/chat_tile_organizer.dart';

class ChatPageOrganizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(105.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'Pesan',
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
                                  hintText: 'Cari Pesan',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget chatTileEo() {
      return Container(
        margin: EdgeInsets.only(top: 0),
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat3.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat8.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat9.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat10.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat11.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat12.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat13.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat14.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
            ChatTileOrganizer(
              imageUrl: 'assets/img_chat15.png',
              name: 'Nama Mitra Industri',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-organizer');
              },
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          chatTileEo(),
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
}