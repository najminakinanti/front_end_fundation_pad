import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/chat_bubble_mitra.dart';


class DetailChatEventMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 5),
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
                    Image.asset(
                      'assets/img_chat2.png',
                      width: 40,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mufest 2024',
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Company Technology',
                          style: blackTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget chatDate() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Minggu, 7 April 2024',
            style: grayTextStyle.copyWith(fontSize: 14),
          ),
        ),
      );
    }

    Widget chatToday() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Today',
            style: grayTextStyle.copyWith(fontSize: 14),
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ketikkan Pesan',
                      border: InputBorder.none,
                      suffixIcon: Image.asset(
                        'assets/icon_send.png',
                        width: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
          chatDate(),
          ChatBubbleMitra(
            isSender: true,
            text: 'Halo, acaranya kapan ya bu',
          ),
          ChatBubbleMitra(
            isSender: false,
            text: 'Acaranya mungkin sebulan lagi, bu',
          ),
          ChatBubbleMitra(
            isSender: true,
            text: 'Baik bu, sebentar',
          ),
          ChatBubbleMitra(
            isSender: false,
            text: 'Baik, kita tunggu',
          ),
          ChatBubbleMitra(
            isSender: true,
            text: 'Baik bu, sebentar',
          ),
          chatToday(),
          ChatBubbleMitra(
            isSender: true,
            text: 'Halo bu',
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),

    );
  }
}