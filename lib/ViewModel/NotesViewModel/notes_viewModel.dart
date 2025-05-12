import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/extract_notes_util.dart';
import 'package:zapdocs/Config/Utils/utils.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_http_repo.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_repo.dart';

class NotesViewmodel with ChangeNotifier {
  final NotesRepo _repo = NotesHttpRepo();

  // Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void generateNotes(file, BuildContext context) async {
    setLoading(true);
    await _repo.generateNotes(file).then((value) {
      setLoading(false);
      var data =
          ExtractNotesUtil.extractHeadingsAndContent(value.content ?? "");
      Navigator.pushNamed(context, RouteNames.notesView, arguments: {
        "Notes": data,
        "docType": value.docType ?? "",
      });
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }
}
