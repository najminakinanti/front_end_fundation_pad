import 'package:flutter/material.dart';
import 'package:pad_fundation/widgets/mitra/event_card_big_mitra.dart';
import '../event_by_category_mitra.dart';

class SenimanPageMitra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategoryMitra(
      title: 'Event Seniman',
      eventCards: [
        EventCardBigMitra(
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
        EventCardBigMitra(
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
