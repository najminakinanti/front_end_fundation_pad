import 'package:flutter/material.dart';
import 'package:pad_fundation/widgets/organizer/chat_tile_organizer.dart';
import '../../theme.dart';

class DetailChatEventOrganizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
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
                      'Chat Event MusicFest',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
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
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          chatTileEo(),
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