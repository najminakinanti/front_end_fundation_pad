import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import '../models/kontraprestasi.dart';

class KontraprestasiCategory extends StatelessWidget {
  final List<Kontraprestasi> kontraprestasis;

  const KontraprestasiCategory({super.key, required this.kontraprestasis});

  String _formatCurrency(int? amount) {
    if (amount == null) return '-';
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(0)} Juta';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(0)} Ribu';
    } else {
      return '$amount';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: kontraprestasis.map((item) {
        final title = item.title ?? 'Unknown';
        final minSponsor = _formatCurrency(item.minSponsor);
        final maxSponsor = _formatCurrency(item.maxSponsor);
        final rangeText = "$minSponsor - $maxSponsor";
        final feedback = item.feedback?.trim().isNotEmpty == true
            ? item.feedback!
            : "- Detail kontraprestasi untuk paket $title belum tersedia.";

        return Card(
          elevation: 2,
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_${title.toLowerCase()}.png',
                      width: 16,
                      errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(width: 16), // fallback if asset not found
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: grayTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  rangeText,
                  style: grayTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 16.0,
                  right: 16.0,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  feedback,
                  style: grayTextStyle.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
