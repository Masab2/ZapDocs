import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/extract_notes_util.dart';
import 'package:zapdocs/Config/Utils/utils.dart';
import 'package:zapdocs/Model/GetAllNotesModel/get_all_notes_model.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_http_repo.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_repo.dart';
import 'package:zapdocs/ViewModel/FilePickerViewModel/file_picker_viewModel.dart';
import 'package:zapdocs/data/Response/api_response.dart';

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
      Provider.of<FilePickerViewmodel>(context, listen: false).clearFile();
      getAllNotesApi();
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

  ApiResponse<GetAllNotesModel> apiResponse = ApiResponse.notStarted();

  void setApiResponse(ApiResponse<GetAllNotesModel> response) {
    apiResponse = response;
    notifyListeners();
  }

  void getAllNotesApi() async {
    try {
      setApiResponse(ApiResponse.loading());
      await _repo.getAllNotesApi().then((value) {
        setApiResponse(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        setApiResponse(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      setApiResponse(ApiResponse.error(e.toString()));
    }
  }
}
