import 'package:flutter/material.dart';
import '../../../widgets/organizer/event_card_big_organizer.dart';
import '../event_by_category_organizer.dart';

class PopulerPageOrganizer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategoryOrganizer(
      title: 'Event Populer',
      eventCards: [
        EventCardBigOrganizer(
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
        EventCardBigOrganizer(
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
        EventCardBigOrganizer(
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
