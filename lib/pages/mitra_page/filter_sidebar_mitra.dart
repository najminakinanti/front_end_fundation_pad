import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class FilterSidebarMita extends StatefulWidget {
  final Function(Map<String, dynamic>) onApply;

  const FilterSidebarMita({super.key, required this.onApply});

  @override
  _FilterSidebarMitaState createState() => _FilterSidebarMitaState();
}

class _FilterSidebarMitaState extends State<FilterSidebarMita> {
  final List<String> categories = [
    'Kuliner',
    'Festival',
    'Pendidikan',
    'Seniman',
  ];

  final List<String> fundRanges = [
    '<10.000.000',
    '<20.000.000',
    '<50.000.000',
    '<100.000.000',
    '≥100.000.000',
  ];

  Map<String, bool> selectedCategories = {};
  String? selectedFundRange;

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      selectedCategories[category] = false;
    }
    selectedFundRange = null;
  }

  Widget filterChip(String label, Map<String, bool> selections) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selections[label] = !(selections[label] ?? false);
        });
      },
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: selections[label]! ? primaryColor : Colors.transparent,
          border: Border.all(color: grayBorderPayment),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center( // Center the text
          child: Text(
            label,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
              color: selections[label]! ? navbarColor : textColor2,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget filterChip2(String label) {
    final isSelected = selectedFundRange == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedFundRange = null; // toggle off jika klik yang sama
          } else {
            selectedFundRange = label; // set pilihan baru
          }
        });
      },
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          border: Border.all(color: grayBorderPayment),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center( // Center the text
          child: Text(
            label,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
              color: isSelected ? navbarColor : textColor2,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: backgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'Filter',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: regular,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Divider(
                            color: textColor2,
                            thickness: 1,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Kategori Event',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 20),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: categories
                                .map((category) =>
                                filterChip(category, selectedCategories))
                                .toList(),
                          ),
                          SizedBox(height: 35),
                          Text(
                            'Kisaran Kebutuhan Dana',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 20),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: fundRanges
                                .map((range) => filterChip2(range))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        final filters = {
                          'categories': selectedCategories,
                          'fundRange': selectedFundRange,
                        };
                        // Tutup modal dulu
                        Navigator.of(context).pop();
                        // Navigasi ke halaman filter-event, passing filters sebagai argument
                        Navigator.pushNamed(context, '/filter-event-mitra', arguments: filters);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: Text(
                        'Terapkan',
                        style: whiteTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

}
