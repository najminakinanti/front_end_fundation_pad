import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/chat_tile_organizer.dart';

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
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: textColor3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icon_search.png', width: 18),
                            SizedBox(width: 5),
                            Text(
                              'Cari Pesan',
                              style: veryLightGrayTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
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
            ChatTileOrganizer(),
            ChatTileOrganizer(),
            ChatTileOrganizer(),
            ChatTileOrganizer(),
            ChatTileOrganizer(),
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