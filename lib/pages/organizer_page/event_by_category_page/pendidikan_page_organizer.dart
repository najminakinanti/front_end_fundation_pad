import 'package:flutter/material.dart';
import '../../../widgets/organizer/event_card_big_organizer.dart';
import '../event_by_category_organizer.dart';

class PendidikanPageOrganizer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategoryOrganizer(
      title: 'Event Pendidikan',
      eventCards: [
        EventCardBigOrganizer(
          imageUrl: 'assets/img_educ_fest.png',
          status: 'OFFLINE',
          title: 'Edu Fest 2024',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Pendidikan', 'Formal', 'Konseling'],
        ),
        EventCardBigOrganizer(
          imageUrl: 'assets/img_experiment_class.png',
          status: 'OFFLINE',
          title: 'Experiment Class',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.8,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Fisika', 'Pendidikan', 'Diskusi'],
        ),
        EventCardBigOrganizer(
          imageUrl: 'assets/img_literasi.png',
          status: 'OFFLINE',
          title: 'Literasi Bersama',
          date: '20 Mei 2024',
          amountCollected: 'Rp900.000',
          percentage: 0.9,
          donorshipCount: 100,
          remainingDays: '230',
          categories: ['Pengetahuan', 'Buku', 'Membaca'],
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
