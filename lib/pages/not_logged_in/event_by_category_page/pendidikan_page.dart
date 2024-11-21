import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/not_logged_in/event_by_category.dart';
import '../../../widgets/guess/event_card_bookmark.dart';

class PendidikanPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EventByCategory(
      title: 'Event Pendidikan',
      eventCards: [
        EventCardBookmark(
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
        EventCardBookmark(
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
        EventCardBookmark(
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
