import 'package:flutter/material.dart';
import '../../../widgets/organizer/event_card_big_organizer.dart';
import '../event_by_category_organizer.dart';

class FestivalPageOrganizer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategoryOrganizer(
      title: 'Event Festival',
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
          categories: ['Musik', 'Festival', 'Hiburan'],
        ),
        EventCardBigOrganizer(
          imageUrl: 'assets/img_kochella.png',
          status: 'OFFLINE',
          title: 'KoChella 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp100.000.000',
          percentage: 0.8,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Musik', 'Festival', 'Budaya'],
        ),
        EventCardBigOrganizer(
          imageUrl: 'assets/img_wayang.png',
          status: 'OFFLINE',
          title: 'Wayang Fest',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Musik', 'Jawa', 'Budaya'],
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
