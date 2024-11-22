import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/organizer_page/event_by_category_organizer.dart';
import 'package:pad_fundation/widgets/organizer/event_card_big_organizer.dart';

class SenimanPageOrganizer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategoryOrganizer(
      title: 'Event Seniman',
      eventCards: [
        EventCardBigOrganizer(
          imageUrl: 'assets/img_world_art.png',
          status: 'OFFLINE',
          title: 'World Art Day',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.8,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Seniman', 'Seni Lukis'],
        ),
        EventCardBigOrganizer(
          imageUrl: 'assets/img_seni_kontemporer.png',
          status: 'OFFLINE',
          title: 'Seni Kontemporer 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Seniman', 'Mural'],
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
