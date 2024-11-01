import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 0, right: 0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/img_chat1.png',
                width: 40,
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nama EO',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '12.18 PM',
                          style: grayTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Bagaimana kak?',
                      style: grayTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
