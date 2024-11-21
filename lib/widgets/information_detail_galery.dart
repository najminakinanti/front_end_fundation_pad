import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class InformationDetailWidget extends StatefulWidget {
  @override
  _InformationDetailWidgetState createState() => _InformationDetailWidgetState();
}

class _InformationDetailWidgetState extends State<InformationDetailWidget> {
  final int imagesPerBatch = 4;
  final List<String> images = [
    'assets/img_splash_1.png',
    'assets/img_music_fest.png',
    'assets/img_music_fest.png',
    'assets/img_logo.png',
    'assets/img_music_fest.png',
    'assets/img_logo.png',
    'assets/img_music_fest.png',
    'assets/img_music_fest.png',
  ];

  int currentBatch = 0;

  final double imageHeight = 350;
  final double arrowHeight = 24;

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
                      child: Image.asset(
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
              // Left arrow
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
              // Right arrow
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
    int endIndex = (startIndex + imagesPerBatch).clamp(0, images.length);
    return images
        .sublist(startIndex, endIndex)
        .map((imagePath) => GestureDetector(
      onTap: () => _showLargeImage(context, images, images.indexOf(imagePath)),
      child: Image.asset(
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
            child: Image.asset('assets/icon_double_panah_kiri.png', width: 20,),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getCurrentBatchImages(),
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
            child: Image.asset('assets/icon_double_panah_kanan.png', width: 20,)
          ),
        ],
      ),
    );
  }
}
