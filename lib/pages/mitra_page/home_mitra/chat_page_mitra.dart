import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import '../../../widgets/mitra/chat_tile_mitra.dart';

class ChatPageMitra extends StatelessWidget {
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

    Widget chatTile() {
      return Container(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ChatTileMitra(
              imageUrl: 'assets/img_chat3.png',
              name: 'Nama Eo',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-mitra');
              },
            ),
            ChatTileMitra(
              imageUrl: 'assets/img_chat6.png',
              name: 'Nama Eo',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-mitra');
              },
            ),
            ChatTileMitra(
              imageUrl: 'assets/img_chat9.png',
              name: 'Nama Eo',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-mitra');
              },
            ),
            ChatTileMitra(
              imageUrl: 'assets/img_chat10.png',
              name: 'Nama Eo',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-mitra');
              },
            ),
            ChatTileMitra(
              imageUrl: 'assets/img_chat3.png',
              name: 'Nama Eo',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-mitra');
              },
            ),
            ChatTileMitra(
              imageUrl: 'assets/img_chat15.png',
              name: 'Nama Eo',
              message: 'Bagaimana kak?',
              time: '12:18 PM',
              onTap: () {
                Navigator.pushNamed(context, '/detail-chat-mitra');
              },
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          chatTile(),
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