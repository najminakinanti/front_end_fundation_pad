import 'package:flutter/material.dart';

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
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Permintaan Pencairan Dana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jumlah Dana'),
                Text(amount),
              ],
            ),
            SizedBox(height: 10),
            Text('Rekening Bank'),
            SizedBox(height: 5),
            Text(recipientName),
            Text(bankAndAccountNumber),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika ketika tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}