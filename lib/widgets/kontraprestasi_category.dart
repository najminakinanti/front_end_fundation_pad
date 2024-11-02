import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class KontraprestasiCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icon_gold.png', width: 16,),
                    SizedBox(width: 8), // Space between icon and text
                    Text(
                      "Gold",
                      style: grayTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "35-45 Juta",
                  style: grayTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- Umbul Umbul berjumlah 10 dengan uk 4x5",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Banner berjumlah 5 dengan uk 4x5",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- 5 Konten Instagram",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Logo dalam poster dengan ukuran kecil",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Sertifikat",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Spanduk berjumlah 1 ukuran 10x10",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Banner berjumlah 5 dengan uk 4x5",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Silver Package
        Card(
          elevation: 2,
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icon_silver.png', width: 16,),
                    SizedBox(width: 8), // Space between icon and text
                    Text(
                      "Silver",
                      style: grayTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "25-30 Juta",
                  style: grayTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- Umbul Umbul berjumlah 5 dengan uk 4x5",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Banner berjumlah 3 dengan uk 4x5",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- 3 Konten Instagram",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Logo dalam poster dengan ukuran sedang",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "- Sertifikat",
                      style: grayTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
