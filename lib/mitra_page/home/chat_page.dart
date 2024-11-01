import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/chat_tile.dart';

import '../../theme.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: Text(
          'Pesan',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_logo_2.png',
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Anda tidak dapat mengakses Pesan',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Untuk mengakses pesan, Anda harus',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Text(
                'Daftar terlebih dahulu !',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Registrasi sekarang dan nikmati kemudahannya',
                style: greenTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'DAFTAR SEKARANG',
                        style: whiteTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 5),
                      Image.asset(
                        'assets/icon_panah_kanan.png',
                        width: 6,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: ListView(),
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            ChatTile(),
          ]
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}










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