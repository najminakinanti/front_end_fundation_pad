import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class SponsorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String iconUrl;
  final String category;
  final String amount;

  SponsorCard({
    required this.imageUrl,
    required this.name,
    required this.iconUrl,
    required this.category,
    required this.amount,
  });

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
              backgroundImage: AssetImage(imageUrl),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset(iconUrl, width: 15),
                      SizedBox(width: 4),
                      Text(
                        category,
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
              amount,
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
