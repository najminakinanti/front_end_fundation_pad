import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class FilterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: regular),
          ),
          SizedBox(height: 20),
          Text('Kategori Event', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold)),
          SizedBox(height: 20),
          Wrap(
            spacing: 5,
            runSpacing: 2,
            children: [
              for (var label in ['Festival', 'Musik', 'Pendidikan', 'Kuliner', 'Pameran', 'Formal', 'Informal', 'Tari'])
                FilterChip(
                  label: SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        label,
                        style: lighGrayTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  onSelected: (bool value) {},
                ),
            ],
          ),
          SizedBox(height: 34),
          Text('Kisaran Kebutuhan Dana', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold)),
          SizedBox(height: 20),
          Wrap(
            spacing: 5,
            runSpacing: 2,
            children: [
              for (var label in ['<10.000.000', '10.000.000', '30.000.000', '<10.000.000', '10.000.000', '30.000.000'])
                FilterChip(
                  label: SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        label,
                        style: lighGrayTextStyle.copyWith(fontSize: 10),
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  onSelected: (bool value) {},
                ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Terapkan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: regular,
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
