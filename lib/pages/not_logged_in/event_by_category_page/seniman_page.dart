import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/not_logged_in/event_by_category.dart';
import '../../../widgets/guess/event_card_bookmark.dart';

class SenimanPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategory(
      title: 'Event Seniman',
      eventCards: [
        EventCardBookmark(
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
        EventCardBookmark(
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
