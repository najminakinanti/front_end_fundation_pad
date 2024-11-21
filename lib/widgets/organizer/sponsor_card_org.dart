import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class SponsorCardOrg extends StatefulWidget {
  @override
  _SponsorCardOrgState createState() => _SponsorCardOrgState();
}

class _SponsorCardOrgState extends State<SponsorCardOrg> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primaryColor, width: 1),
      ),
      color: navbarColor,
      elevation: 0, // Remove shadow
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                          Image.asset('assets/icon_gold.png', width: 15),
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
          if (isExpanded)
            Container(
              color: backgroundColor3,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_up,
                      color: textColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                  ),
                  Center(
                    child: Text(
                      "Foto Bukti belum ditambahkan",
                      style: blackTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 12),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/tambah-bukti-kontraprestasi');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: pinkButton,
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Tambah Bukti Kontraprestasi",
                        style: whiteTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          if (!isExpanded)
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: backgroundColor3,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
