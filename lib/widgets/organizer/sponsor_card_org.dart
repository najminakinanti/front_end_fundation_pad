import 'package:flutter/material.dart';
import 'package:pad_fundation/API/evidence_api.dart';
import 'package:pad_fundation/theme.dart';

import '../../models/kontraprestasi_evidences.dart';
import '../../pages/organizer_page/tambah_bukti_kontraprestasi.dart';

class SponsorCardOrg extends StatefulWidget {
  final int sponsorId;
  final String sponsorLogo;
  final String sponsorName;
  final String sponsorType;
  final String sponsorshipAmount;
  final List<String> imageList;
  final String iconPath;

  const SponsorCardOrg({
    required this.sponsorId,
    required this.sponsorLogo,
    required this.sponsorName,
    required this.sponsorType,
    required this.sponsorshipAmount,
    required this.imageList,
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  @override
  _SponsorCardOrgState createState() => _SponsorCardOrgState();
}

class _SponsorCardOrgState extends State<SponsorCardOrg> {
  late Future<List<KontraprestasiEvidence>> _evidencesFuture;
  final ScrollController _scrollController = ScrollController();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadEvidences();
  }

  void _loadEvidences() {
    _evidencesFuture = EvidenceApi.getEvidencesBySponsorId(widget.sponsorId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primaryColor, width: 1),
      ),
      color: navbarColor,
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: widget.sponsorLogo.startsWith('http')
                      ? NetworkImage(widget.sponsorLogo)
                      : AssetImage(widget.sponsorLogo) as ImageProvider,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sponsorName,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(widget.iconPath, width: 15),
                          SizedBox(width: 4),
                          Text(
                            widget.sponsorType,
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
                  widget.sponsorshipAmount,
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
                  FutureBuilder<List<KontraprestasiEvidence>>(
                    future: _evidencesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text("Terjadi kesalahan");
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Column(
                          children: [
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
                                onPressed: () async {
                                  final args = {'sponsorId': widget.sponsorId};
                                  final result = await Navigator.pushNamed(
                                    context,
                                    '/tambah-bukti-kontraprestasi',
                                    arguments: args,
                                  );

                                  if (result == 'refresh') {
                                    _loadEvidences();
                                    setState(() {});
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Tambah Bukti Kontraprestasi",
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Image.asset(
                                      'assets/icon_up_right_arrow.png',
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        final evidences = snapshot.data!;
                        return Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_circle_left_outlined),
                                  onPressed: () {
                                    if (_scrollController.hasClients) {
                                      _scrollController.animateTo(
                                        _scrollController.offset - 100,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: evidences.length,
                                      itemBuilder: (context, index) {
                                        String imagePath = evidences[index].photoFile;
                                        if (!imagePath.startsWith('http')) {
                                          imagePath = '${EvidenceApi.photourl}$imagePath';
                                        }

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Image.network(
                                            imagePath,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/img_profile_picture.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_circle_right_outlined),
                                  onPressed: () {
                                    if (_scrollController.hasClients) {
                                      _scrollController.animateTo(
                                        _scrollController.offset + 100,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 12),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/ubah-bukti-kontraprestasi');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: yellowButton,
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Ubah Bukti Kontraprestasi",
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Image.asset(
                                      'assets/icon_edit.png',
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
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
            ),
        ],
      ),
    );
  }
}
