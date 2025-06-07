import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pad_fundation/API/profile_api.dart';
import 'package:pad_fundation/theme.dart';

import '../../models/sponsor.dart';
import '../../models/kontraprestasi.dart';
import '../../widgets/sponsor_card.dart';

class DaftarSponsorMitra extends StatelessWidget {
  final List<Sponsor> sponsors;
  final List<Kontraprestasi> kontraprestasis;

  DaftarSponsorMitra({
    required this.sponsors,
    required this.kontraprestasis,
  });

  PreferredSize header(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(75.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        centerTitle: false,
        flexibleSpace: Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/icon_panah_kiri.png',
                      width: 8,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Daftar Sponsor Music Fest',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSponsorList() {
    // Kelompokkan sponsor berdasarkan level (kontraprestasi)
    Map<String, List<Sponsor>> groupedSponsors = {};

    for (var kontraprestasi in kontraprestasis) {
      final group = sponsors.where((s) {
        return (s.amount ?? 0) >= (kontraprestasi.minSponsor ?? 0) &&
            (s.amount ?? 0) <= (kontraprestasi.maxSponsor ?? 0);
      }).toList();

      if (group.isNotEmpty) {
        groupedSponsors[kontraprestasi.title ?? 'Unknown'] = group;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedSponsors.entries.map((entry) {
        String category = entry.key;
        List<Sponsor> sponsorsInCategory = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            ...sponsorsInCategory.map((sponsor) {
              final mitra = sponsor.entrepreneur?.mitra;
              final imageUrl = mitra != null
                  ? (mitra.photoFile.startsWith('http')
                  ? mitra.photoFile
                  : '${ProfileApi.photourl}${mitra.photoFile}')
                  : 'assets/img_profile_picture.png';

              return SponsorCard(
                imageUrl: imageUrl,
                name: mitra?.name ?? 'Unknown',
                iconUrl: 'assets/icon_${category.toLowerCase()}.png',
                category: category,
                amount: 'Rp${NumberFormat("#,##0", "id_ID").format(sponsor.amount)}',
              );
            }).toList(),
            SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          SizedBox(height: 10),
          buildSponsorList(),
        ],
      ),
    );
  }
}
