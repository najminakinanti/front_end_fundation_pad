import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/chat_bubble.dart';
import 'package:pad_fundation/theme.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AppBar header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/img_chat1.png',
              width: 40,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama EO',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Nama Event',
                  style: blackTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }


    // TAMBAH KOTAK EVENTNYA


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
        margin: EdgeInsets.all(20),
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
          ChatBubble(
              isSender: true,
            text: 'Halo, acaranya kapan ya bu',
          ),
          ChatBubble(
            isSender: false,
            text: 'Acaranya mungkin sebulan lagi, bu',
          ),
          ChatBubble(
            isSender: true,
            text: 'Baik bu, sebentar',
          ),
          ChatBubble(
            isSender: false,
            text: 'Baik, kita tunggu',
          ),
          ChatBubble(
            isSender: true,
            text: 'Baik bu, sebentar',
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











// import 'package:flutter/material.dart';
// import 'package:pad_fundation/theme.dart';
//
// class DetailChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     Widget header() {
//       return PreferredSize(
//           preferredSize: Size.fromHeight(70),
//           child: AppBar(
//             centerTitle: false,
//             title: Row(
//               children: [
//                 Image.asset(
//                   'assets/icon_panah_kiri.png',
//                   width: 40,
//                 ),
//                 Image.asset(
//                     'assets/img_chat1.png',
//                   width: 40,
//                 ),
//                 SizedBox(
//                   width: 12,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Nama EO',
//                       style: blackTextStyle.copyWith(
//                         fontWeight: bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                     Text(
//                       'Nama Event',
//                       style: blackTextStyle.copyWith(
//                         fontWeight: light,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//       );
//     }
//
//     return Scaffold(
//       appBar: header(),
//     );
//   }
// }
