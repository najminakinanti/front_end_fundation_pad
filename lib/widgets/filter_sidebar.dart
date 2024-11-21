import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class FilterSidebar extends StatefulWidget {
  final Function(Map<String, dynamic>) onApply;

  const FilterSidebar({Key? key, required this.onApply}) : super(key: key);

  @override
  _FilterSidebarState createState() => _FilterSidebarState();
}

class _FilterSidebarState extends State<FilterSidebar> {
  final List<String> categories = [
    'Festival',
    'Kuliner',
    'Pameran',
    'Musik',
    'Pendidikan',
    'Seniman',
    'Formal',
    'Tari',
  ];

  final List<String> fundRanges = [
    '<10.000.000',
    '10.000.000',
    '20.000.000',
    '30.000.000',
  ];

  Map<String, bool> selectedCategories = {};
  Map<String, bool> selectedFundRanges = {};

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      selectedCategories[category] = false;
    }
    for (var range in fundRanges) {
      selectedFundRanges[range] = false;
    }
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
            ),
          ),
        ),
      ),
    );
  }

  Widget filterChip2(String label, Map<String, bool> selections) {
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
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center( // Center the text
          child: Text(
            label,
            style: blackTextStyle.copyWith(
              fontSize: 10,
              fontWeight: regular,
              color: selections[label]! ? navbarColor : textColor2,
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
                            ),
                          ),
                          SizedBox(height: 20),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: fundRanges
                                .map((range) =>
                                filterChip2(range, selectedFundRanges))
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
                        Navigator.pop(context);
                        widget.onApply({
                          'categories': selectedCategories,
                          'fundRanges': selectedFundRanges,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        'Terapkan',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12,
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
