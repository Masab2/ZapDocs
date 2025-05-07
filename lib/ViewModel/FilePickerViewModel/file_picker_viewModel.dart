import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerViewmodel with ChangeNotifier {
  String _selectedFile = '';
  String get selectedFile => _selectedFile;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      _selectedFile = result.files.single.path!;
      notifyListeners();
    } else {
      _selectedFile = '';
      notifyListeners();
    }
  }

  // Clear the selected file
  void clearFile() {
    _selectedFile = '';
    notifyListeners();
  }
}
