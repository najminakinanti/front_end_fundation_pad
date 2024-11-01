import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isSender;

  ChatBubble({this.isSender = false, this.text = '', this.time = '08.45 PM'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 10 : 0),
                      topRight: Radius.circular(isSender ? 0 : 10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: isSender ? sageGreen4 : sageGreen,
                  ),
                  child: Text(
                    text,
                    style: isSender ? whiteTextStyle : blackTextStyle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:pad_fundation/theme.dart';
//
// class ChatBubble extends StatelessWidget {
//
//   final String text;
//   final isSender;
//
//   ChatBubble({this.isSender = false, this.text = ''});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.only(top: 25),
//       child: Row(
//         mainAxisAlignment:
//           isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           Flexible(
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.5,
//               ),
//               padding: EdgeInsets.symmetric(
//                 horizontal: 15,
//                 vertical: 10,
//               ),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(isSender ? 10 : 0),
//                       topRight: Radius.circular(isSender ? 0 : 10),
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                   ),
//                 color: isSender ? sageGreen4 : sageGreen,
//               ),
//               child: Text(
//                 text,
//                 style: isSender ? whiteTextStyle : blackTextStyle,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }