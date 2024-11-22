import 'package:flutter/material.dart';
import 'package:pad_fundation/widgets/mitra/event_card_big_mitra.dart';

import '../event_by_category_mitra.dart';

class KulinerPageMitra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategoryMitra(
      title: 'Event Kuliner',
      eventCards: [
        EventCardBigMitra(
          imageUrl: 'assets/img_kulfood.png',
          status: 'OFFLINE',
          title: 'KulFood 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Musik', 'Festival', 'Festival'],
        ),
        EventCardBigMitra(
          imageUrl: 'assets/img_food_fest.png',
          status: 'OFFLINE',
          title: 'KoChella 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp50.000.000',
          percentage: 0.45,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Kuliner', 'Live Musik', 'Kompetisi Makan'],
        ),
        EventCardBigMitra(
          imageUrl: 'assets/img_italian_kuliner.png',
          status: 'OFFLINE',
          title: 'Italian Kuliner',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Musik', 'Kuliner', 'Festival'],
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
