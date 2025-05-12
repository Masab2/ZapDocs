import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerViewmodel with ChangeNotifier {
  File? _selectedFile;
  File? get selectedFile => _selectedFile;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      _selectedFile = File(result.files.single.path!);
      notifyListeners();
    } else {
      _selectedFile = null;
      notifyListeners();
    }
  }

  void clearFile() {
    _selectedFile = null;
    notifyListeners();
  }
}
