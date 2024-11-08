import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class ChatBubbleOrganizer extends StatelessWidget {
  final String text;
  final String time;
  final bool isSender;

  ChatBubbleOrganizer({this.isSender = true, this.text = '', this.time = '08.45 PM'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
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
                      topLeft: Radius.circular(isSender ? 0 : 10),
                      topRight: Radius.circular(isSender ? 10 : 0),
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
            alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
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