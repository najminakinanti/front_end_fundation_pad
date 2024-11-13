import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class WithdrawalRequestCard extends StatelessWidget {
  final String amount;
  final String recipientName;
  final String bankAndAccountNumber;
  final String buttonText;
  final Color buttonColor;

  const WithdrawalRequestCard({
    Key? key,
    required this.amount,
    required this.recipientName,
    required this.bankAndAccountNumber,
    required this.buttonText,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sageGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: sageGreen3,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                'Permintaan Pencairan Dana',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah Dana',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      amount,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17),
                Text(
                  'Rekening Bank',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: textColor2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipientName,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        bankAndAccountNumber,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                      Navigator.pushNamed(context, '/list-transaksi');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 7),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
