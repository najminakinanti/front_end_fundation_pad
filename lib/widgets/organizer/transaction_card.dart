import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String amount;
  final String status;
  final VoidCallback onTap;

  const TransactionCard({
    Key? key,
    required this.name,
    required this.amount,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: brown, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        amount,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    status,
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: medium,
                      color: getColorByStatus(status),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColorByStatus(String status) {
    switch (status) {
      case 'Diproses':
        return orange;
      case 'Gagal':
        return darkBrown;
      case 'Selesai':
        return green;
      default:
        return darkBrown;
    }
  }
}