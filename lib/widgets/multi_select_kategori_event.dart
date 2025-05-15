// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
//
// class MultiSelectKategoriEvent extends StatefulWidget {
//   final List<String> selectedCategories;
//   final ValueChanged<List<String>> onCategoriesChanged;
//
//   const MultiSelectKategoriEvent({
//     Key? key,
//     required this.selectedCategories,
//     required this.onCategoriesChanged,
//   }) : super(key: key);
//
//   @override
//   State<MultiSelectKategoriEvent> createState() => _MultiSelectKategoriEventState();
// }
//
// class _MultiSelectKategoriEventState extends State<MultiSelectKategoriEvent> {
// // Daftar pilihan kategori
//   final List<String> _categories = ['kategorinya', 'ada', 'apa', 'aja'];
//
// // Menyimpan pilihan saat ini
//   late List<String> _selectedItems;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedItems = widget.selectedCategories;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiSelectDialogField<String>(
//       items: _categories.map((e) => MultiSelectItem(e, e)).toList(),
//       title: const Text("Kategori Event"),
//       buttonText: const Text("Pilih kategori event"),
//       initialValue: _selectedItems,
//       onConfirm: (values) {
//         setState(() {
//           _selectedItems = values;
//         });
//         widget.onCategoriesChanged(values);
//       },
//       chipDisplay: MultiSelectChipDisplay(
//         onTap: (value) {
//           setState(() {
//             _selectedItems.remove(value);
//           });
//           widget.onCategoriesChanged(_selectedItems);
//         },
//       ),
//     );
//   }
// }