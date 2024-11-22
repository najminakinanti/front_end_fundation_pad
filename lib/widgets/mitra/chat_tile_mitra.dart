import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class ChatTileMitra extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final String time;
  final VoidCallback onTap;

  ChatTileMitra({
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imageUrl,
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
                            name,
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            time,
                            style: grayTextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        message,
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
      ),
    );
  }
}
