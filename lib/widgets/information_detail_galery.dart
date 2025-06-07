import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pad_fundation/API/event_api.dart';
import 'package:pad_fundation/theme.dart';

class InformationDetailWidget extends StatefulWidget {
  final String eventId; // parameter eventId untuk fetch gambar

  InformationDetailWidget({required this.eventId});

  @override
  _InformationDetailWidgetState createState() => _InformationDetailWidgetState();
}

class _InformationDetailWidgetState extends State<InformationDetailWidget> {
  final int imagesPerBatch = 4;

  List<String> images = []; // kosong, tanpa default placeholder

  int currentBatch = 0;

  final double imageHeight = 350;
  final double arrowHeight = 24;

  @override
  void initState() {
    super.initState();
    print('Fetching images for eventId: ${widget.eventId}');
    fetchImages(widget.eventId);
  }

  Future<void> fetchImages(String eventId) async {
    try {
      final eventApi = EventApi();
      List<String> fetchedImages = await eventApi.fetchEventGallery(eventId);

      print('Fetched images from API: $fetchedImages');  // <-- print isi list

      if (mounted) {
        setState(() {
          images = fetchedImages;
          currentBatch = 0;
        });
      }
    } catch (e) {
      print('Error fetching images: $e');
    }
  }


  void _showLargeImage(BuildContext context, List<String> imagePaths, int initialIndex) {
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Timeline Music Fest",
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: imagePaths[currentIndex].startsWith('http')
                          ? Image.network(
                        imagePaths[currentIndex],
                        height: imageHeight,
                        fit: BoxFit.contain,
                      )
                          : Image.asset(
                        imagePaths[currentIndex],
                        height: imageHeight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -25,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: textColor3,
                      child: Image.asset(
                        'assets/icon_x.png',
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (imageHeight / 2) - (arrowHeight / 2) + 55,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex > 0) {
                      currentIndex--;
                      Navigator.of(context).pop();
                      _showLargeImage(context, imagePaths, currentIndex);
                    }
                  },
                  child: Image.asset(
                    'assets/icon_button_panah_kiri.png',
                    width: 24,
                  ),
                ),
              ),
              Positioned(
                top: (imageHeight / 2) - (arrowHeight / 2) + 55,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex < imagePaths.length - 1) {
                      currentIndex++;
                      Navigator.of(context).pop();
                      _showLargeImage(context, imagePaths, currentIndex);
                    }
                  },
                  child: Image.asset(
                    'assets/icon_button_panah_kanan.png',
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _getCurrentBatchImages() {
    int startIndex = currentBatch * imagesPerBatch;
    int endIndex = startIndex + imagesPerBatch;

    if (endIndex > images.length) {
      endIndex = images.length;
      startIndex = (endIndex - imagesPerBatch).clamp(0, images.length);
    }

    return images
        .sublist(startIndex, endIndex)
        .map((imagePath) => GestureDetector(
      onTap: () => _showLargeImage(context, images, images.indexOf(imagePath)),
      child: imagePath.startsWith('http')
          ? Image.network(
        imagePath,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      )
          : Image.asset(
        imagePath,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: lineColor3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (currentBatch > 0) {
                setState(() {
                  currentBatch--;
                });
              }
            },
            child: Image.asset(
              'assets/icon_double_panah_kiri.png',
              width: 20,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _getCurrentBatchImages()
                    .map((widget) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: widget,
                ))
                    .toList(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentBatch < (images.length / imagesPerBatch).ceil() - 1) {
                setState(() {
                  currentBatch++;
                });
              }
            },
            child: Image.asset(
              'assets/icon_double_panah_kanan.png',
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
