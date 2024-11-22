import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/not_logged_in/event_by_category.dart';

import '../../../widgets/guess/event_card_bookmark.dart';

class PopulerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategory(
      title: 'Event Populer',
      eventCards: [
        EventCardBookmark(
          imageUrl: 'assets/img_music_fest.png',
          status: 'OFFLINE',
          title: 'Music Fest 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp90.000.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Musik', 'Festival', 'DJ', 'EDM', 'Hiburan'],
        ),
        EventCardBookmark(
          imageUrl: 'assets/img_kulfood.png',
          status: 'OFFLINE',
          title: 'KulFood 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.8,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Kuliner', 'Live Musik', 'Festival', 'Seafood', 'BBQ', 'Food Truck'],
        ),
        EventCardBookmark(
          imageUrl: 'assets/img_kochella.png',
          status: 'OFFLINE',
          title: 'KoChella 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.7,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Musik', 'Festival', 'Budaya', 'Live', 'EDM', 'K-Pop'],
        ),
      ],
      onSearchChanged: (value) {
        print('Search query: $value');
      },
      onFilterPressed: (context) {
        showModalRightSheet(context);
      },
    );
  }
}
