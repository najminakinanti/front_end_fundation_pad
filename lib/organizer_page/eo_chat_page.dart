import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/chat_tile_eo.dart';
import '../../theme.dart';

class EoChatPage extends StatelessWidget {
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
                    'assets/img_loop.png',
                    width: 30,
                    height: 30,
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

    Widget chatTileEo() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
            ChatTileEo(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        searchBar(),
        chatTileEo(),
      ],
    );
  }
}


