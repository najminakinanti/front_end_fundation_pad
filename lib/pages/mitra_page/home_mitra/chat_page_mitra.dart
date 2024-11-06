import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import '../../../widgets/chat_tile.dart';

class ChatPageMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesan',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      );
    }

    Widget searchBar() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: textColor3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icon_search.png',
                    width: 20,
                    height: 20,
                  ),
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
        ),
      );
    }

    Widget chatTile() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ChatTile(),
            ChatTile(),
            ChatTile(),
            ChatTile(),
            ChatTile(),
            ChatTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        searchBar(),
        chatTile(),
      ],
    );
  }
}