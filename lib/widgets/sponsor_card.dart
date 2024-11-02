import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class SponsorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      color: backgroundColor3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/img_bittersweet.png'),
            ),

            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bittersweet by Najla",
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset('assets/icon_gold.png', width: 15,),
                      SizedBox(width: 4),
                      Text(
                        "Gold",
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Price Information
            Text(
              "Rp35.000.000",
              style: lighGrayTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}