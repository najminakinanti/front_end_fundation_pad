import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/chat_tile.dart';
import '../../theme.dart';

class ChatPage extends StatelessWidget {
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







// import 'package:flutter/material.dart';
// import 'package:pad_fundation/splash_screen/chat_tile.dart';
//
// import '../../theme.dart';
//
// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     Widget header() {
//       return Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Pesan',
//               style: blackTextStyle.copyWith(
//                 fontSize: 20,
//                 fontWeight: bold,
//               ),
//             ),
//             SizedBox(height: 4),
//           ],
//         ),
//       );
//     }
//
//     Widget searchBar() {
//       return Container(
//         margin: EdgeInsets.only(top: 18),
//         child: SizedBox(
//           width: double.infinity,
//           child: TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               backgroundColor: textColor3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Container(
//               alignment: Alignment.centerLeft,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     'assets/img_loop.png',
//                     width: 30,
//                     height: 30,
//                   ),
//                   SizedBox(width: 5),
//                   Text(
//                     'Cari Event',
//                     style: veryLightGrayTextStyle.copyWith(
//                       fontSize: 16,
//                       fontWeight: medium,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//
//     Widget emptyChat() {
//       return Container(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/img_logo_2.png',
//               width: 100,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Anda tidak dapat mengakses Pesan',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'Untuk mengakses pesan, Anda harus',
//               style: greenTextStyle.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             Text(
//               'Daftar terlebih dahulu !',
//               style: greenTextStyle.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'Registrasi sekarang dan nikmati kemudahannya',
//               style: greenTextStyle.copyWith(
//                 fontSize: 12,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               height: 44,
//               child: TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 10,
//                   ),
//                   backgroundColor: buttonColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'DAFTAR SEKARANG',
//                       style: whiteTextStyle.copyWith(
//                         fontWeight: bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Image.asset(
//                       'assets/icon_panah_kanan.png',
//                       width: 6,
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     Widget chatTile() {
//       return Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//         child: ListView(
//           shrinkWrap: true, // Ensure the ListView can shrink to fit its contents
//           physics: NeverScrollableScrollPhysics(), // Disable scrolling if necessary
//           children: [
//             ChatTile(),
//             ChatTile(),
//             ChatTile(),
//             ChatTile(),
//             ChatTile(),
//             ChatTile(),
//             // Add more ChatTile widgets here as needed
//           ],
//         ),
//       );
//     }
//
//     return ListView(
//       children: [
//         header(),
//         searchBar(),
//         chatTile()
//       ],
//     );
//   }
// }














// import 'package:flutter/material.dart';
// import 'package:pad_fundation/splash_screen/chat_tile.dart';
//
// import '../../theme.dart';
//
// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return AppBar(
//         backgroundColor: backgroundColor,
//         centerTitle: false,
//         title: Text(
//           'Pesan',
//           style: blackTextStyle.copyWith(
//             fontSize: 20,
//             fontWeight: bold,
//           ),
//         ),
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       );
//     }
//
//     Widget searchBar() {
//       return Container(
//         margin: EdgeInsets.only(top: 18),
//         child: SizedBox(
//           width: double.infinity,
//           child: TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               backgroundColor: textColor3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Container(
//               alignment: Alignment.centerLeft,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     'assets/icon_panah_kanan.png',
//                     width: 6,
//                     height: 10,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     'Cari Event',
//                     style: veryLightGrayTextStyle.copyWith(
//                       fontSize: 16,
//                       fontWeight: medium,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//
//
//     Widget emptyChat() {
//       return Expanded(
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/img_logo_2.png',
//                 width: 100,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'Anda tidak dapat mengakses Pesan',
//                 style: blackTextStyle.copyWith(
//                   fontSize: 16,
//                   fontWeight: medium,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Untuk mengakses pesan, Anda harus',
//                 style: greenTextStyle.copyWith(
//                   fontSize: 14,
//                   fontWeight: medium,
//                 ),
//               ),
//               Text(
//                 'Daftar terlebih dahulu !',
//                 style: greenTextStyle.copyWith(
//                   fontSize: 14,
//                   fontWeight: medium,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Registrasi sekarang dan nikmati kemudahannya',
//                 style: greenTextStyle.copyWith(
//                   fontSize: 12,
//                   fontWeight: medium,
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//
//               Container(
//                 height: 44,
//                 child: TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 10,
//                     ),
//                     backgroundColor: buttonColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'DAFTAR SEKARANG',
//                         style: whiteTextStyle.copyWith(
//                           fontWeight: bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       Image.asset(
//                         'assets/icon_panah_kanan.png',
//                         width: 6,
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     Widget chatTile() {
//       return Expanded(
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(
//             horizontal: defaultMargin,
//           ),
//           child: ListView(
//             children: [
//               ChatTile(),
//             ],
//           ),
//         ),
//       );
//     }
//
//     return ListView(
//       children: [
//         header(),
//         searchBar(),
//         chatTile(),
//       ],
//     );
//   }
// }










// import 'package:flutter/material.dart';
//
// import '../../theme.dart';
//
// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return AppBar(
//         backgroundColor: backgroundColor,
//         centerTitle: true,
//         title: Text(
//           'Message Support',
//           style: greenTextStyle.copyWith(
//             fontSize: 18,
//             fontWeight: medium,
//           ),
//         ),
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       );
//     }
//
//     Widget content() {
//       return Expanded(
//         child: Container(
//           width: double.infinity,
//           color: backgroundColor3,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                   'assets/img_logo_2.png',
//               width: 100,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'Anda tidak dapat mengakses Pesan',
//                 style: blackTextStyle.copyWith(
//                     fontSize: 16,
//                     fontWeight: medium,
//                 ),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               Text(
//                 'Untuk mengakses pesan, Anda harus Daftar terlebih dahulu !',
//                 style: blackTextStyle,
//               ),
//               Container(
//                 height: 44,
//                 child: TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 10,
//                   ),
//                     backgroundColor: primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)
//                     ),
//                   ),
//                   child: Text(
//                     'DAFTAR SEKARANG',
//                     style: whiteTextStyle.copyWith(
//                       fontWeight: medium,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     return Column(
//       children: [
//         header(),
//         content(),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
//
// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Chat'),
//     );
//   }
// }