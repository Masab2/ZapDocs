import 'package:flutter/material.dart';

class HistoryProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final List<String> filterOptions = ['All', 'Documents', 'PPTs', 'PDFs'];
  String _selectedFilter = 'All';

  String get selectedFilter => _selectedFilter;

  void setFilter(String value) {
    _selectedFilter = value;
    notifyListeners();
  }

  void onSearch(String query) {
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
